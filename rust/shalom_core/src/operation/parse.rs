use std::collections::HashMap;
use std::path::PathBuf;
use std::sync::Arc;

use apollo_compiler::{executable as apollo_executable, Node};
use log::info;

use crate::context::SharedShalomGlobalContext;
use crate::operation::types::ObjectSelection;
use crate::schema::context::SharedSchemaContext;

use super::context::{OperationContext, SharedOpCtx};
use super::types::{Selection, SharedObjectSelection};

fn parse_object_selection(
    parent: Option<Selection>,
    op_ctx: &mut OperationContext,
    schema_ctx: &SharedSchemaContext,
    selection_orig: &apollo_compiler::executable::SelectionSet,
    name: String,
) -> SharedObjectSelection {
    assert!(
        !selection_orig.selections.is_empty(),
        "Object selection must have at least one field"
    );
    let obj = ObjectSelection::new(parent, name.clone());
    let obj_as_selection = Selection::Object(obj.clone());

    for selection in selection_orig.selections.iter() {
        match selection {
            apollo_executable::Selection::Field(field) => {
                let f_name = field.name.clone().to_string();
                let field_selection = parse_selection_set(
                    Some(obj_as_selection.clone()),
                    op_ctx,
                    schema_ctx,
                    &field.selection_set,
                    f_name,
                );
                obj.add_selection(field_selection);
            }
            _ => todo!("Unsupported selection type {:?}", selection),
        }
    }
    obj
}

fn parse_selection_set(
    parent: Option<Selection>,
    op_ctx: &mut OperationContext,
    schema_ctx: &SharedSchemaContext,
    selection_orig: &apollo_compiler::executable::SelectionSet,
    name: String,
) -> Selection {
    let out;
    let full_name = match parent.clone() {
        Some(selection) => selection.combine_full_name(&name),
        _ => name.clone(),
    };
    if let Some(selection) = op_ctx.get_selection(&full_name) {
        info!("Selection already exists");
        return selection.clone();
    }
    // thats a scalar no inner selections
    if selection_orig.selections.is_empty() {
        todo!("parse scalar")
    } else {
        out = Selection::Object(parse_object_selection(
            parent,
            op_ctx,
            schema_ctx,
            selection_orig,
            name.clone(),
        ));
    }
    op_ctx.add_selection(name.clone(), out.clone());
    out
}

fn parse_operation(
    global_ctx: &SharedShalomGlobalContext,
    op: Node<apollo_compiler::executable::Operation>,
    name: String,
    file_path: PathBuf,
) -> SharedOpCtx {
    let mut ctx = OperationContext::new(global_ctx.schema_ctx.clone(), file_path);
    let root_type = parse_object_selection(
        None,
        &mut ctx,
        &global_ctx.schema_ctx,
        &op.selection_set,
        name.clone(),
    );
    ctx.set_root_type(root_type);
    Arc::new(ctx)
}

pub(crate) fn parse_document(
    global_ctx: &SharedShalomGlobalContext,
    source: &str,
    doc_path: &PathBuf,
) -> anyhow::Result<HashMap<String, SharedOpCtx>> {
    let mut ret = HashMap::new();
    let mut parser = apollo_compiler::parser::Parser::new();
    let schema = global_ctx.schema_ctx.schema.clone();
    let doc_orig = parser
        .parse_executable(&schema, source, doc_path)
        .map_err(|e| anyhow::anyhow!("Failed to parse document: {}", e))?;
    let doc_orig = doc_orig.validate(&schema).expect("doc is not valid");

    if doc_orig.operations.anonymous.is_some() {
        unimplemented!("Anonymouse operations are not supported")
    }
    for (name, op) in doc_orig.operations.named.iter() {
        let name = name.to_string();
        ret.insert(
            name.clone(),
            parse_operation(global_ctx, op.clone(), name, doc_path.clone()),
        );
    }
    Ok(ret)
}
