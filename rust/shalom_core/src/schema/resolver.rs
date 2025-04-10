use std::{collections::{HashMap, HashSet,}};
use std::sync::Arc;
use super::context::{SchemaContext, SharedSchemaContext};
use super::types::{FieldDefinition, FieldType, GraphQLAny, ScalarType, EnumValueDefinition, EnumType, InputObjectType, InputValueDefinition};
use super::{types::ObjectType, utils::TypeRef};
use anyhow::Result;
use apollo_compiler::{self, ast};
use apollo_compiler::{schema as apollo_schema, Node};
use log::{debug, info};
use ahash::random_state::RandomState;

const DEFAULT_SCALAR_TYPES: [(&str, &str); 8] = [
    ("String", "A UTF‐8 character sequence."),
    ("Int", "A signed 32‐bit integer."),
    ("Float", "A signed double-precision floating-point value."),
    ("Boolean", "true or false."),
    ("ID", "A unique identifier."),
    ("Date", "A date and time."),
    ("DateTime", "A date and time."),
    ("Time", "A time."),
];

pub(crate) fn resolve(schema: &str) -> Result<SharedSchemaContext> {
    let mut initial_types = HashMap::new();

    // Add the default scalar types
    for (name, description) in DEFAULT_SCALAR_TYPES.iter() {
        initial_types.insert(
            name.to_string(),
            GraphQLAny::Scalar(Node::new(ScalarType {
                name: name.to_string(),
                description: Some(description.to_string()),
            })),
        );
    }
    let schema_raw = match apollo_compiler::Schema::parse(schema, "schema.graphql") {
        Ok(schema) => schema,
        Err(e) => return Err(anyhow::anyhow!("Error parsing schema: {}", e)),
    };
    let schema = match schema_raw.validate() {
        Ok(schema) => {
            info!("✅ Parsed schema");
            schema
        }
        Err(e) => return Err(anyhow::anyhow!("Error validating schema: {}", e)),
    };

    let ctx = Arc::new(SchemaContext::new(initial_types, schema.clone()));

    for (name, type_) in &schema.types {
        if name.starts_with("__") {
            continue;
        }
        debug!("Resolving type: {:?}", name);
        match type_ {
            apollo_schema::ExtendedType::Object(object) => {
                resolve_object(ctx.clone(), name.to_string(), object.clone());
            }
            apollo_schema::ExtendedType::Scalar(scalar) => {
                let name = scalar.name.to_string();
                let description = scalar.description.as_ref().map(|v| v.to_string());
                ctx.add_scalar(name.clone(), Node::new(ScalarType { name, description }))
                    .unwrap();
            },
            apollo_schema::ExtendedType::Enum(_enum) => {
                resolve_enum(ctx.clone(), _enum.name.to_string(), _enum.clone());
            }
            apollo_schema::ExtendedType::InputObject(input) =>  {
                println!("{:?}", input.fields.clone());
                resolve_input(ctx.clone(), input.name.to_string(), input.clone());
            }
            _ => todo!(
                "Unsupported type in schema {:?}: {:?}",
                name.to_string(),
                type_.name()
            ),
        }
    }

    Ok(ctx)
}

#[allow(unused)]
fn resolve_enum(context: SharedSchemaContext, name: String, origin: Node<apollo_schema::EnumType>) -> TypeRef {
      if context.get_type(&name).is_some() {
        return TypeRef::new(context.clone(), name);
      }
      let description = origin.description.as_ref().map(|v| v.to_string());
      let mut enum_values = HashMap::with_hasher(RandomState::new());
      for (name, definition) in &origin.values {
        let enum_value_description = if definition.description.is_some() {
            Some(definition.description.as_ref().unwrap().to_string()) 
        } else {
            None
        };
        let enum_definition = EnumValueDefinition {
            description: enum_value_description,
            value: definition.value.to_string()
        };
        enum_values.insert(name.to_string(), Box::new(enum_definition));
      } 
        let enum_description = if origin.description.is_some() {
            Some(origin.description.as_ref().unwrap().to_string()) 
        } else {
            None
        };
      let _enum = EnumType {
        description:  enum_description, 
        name: name.clone(), 
        values: enum_values
      };
      context.add_enum(name.clone(), Node::new(_enum));
      return TypeRef::new(context.clone(), name);
}

#[allow(unused)]
fn resolve_input(
    context: SharedSchemaContext,
    name: String,
    origin: Node<apollo_schema::InputObjectType>,
) -> TypeRef {
   if context.get_type(&name).is_some() {
        return TypeRef::new(context.clone(), name);
    }
    let description = if origin.description.is_some() {
            Some(origin.description.as_ref().unwrap().to_string())
         } else {
            None
         }; 
    let mut inputs = HashMap::with_hasher(RandomState::new());
    for (name, input) in origin.fields.iter() {
        println!("{:?}", input);
         let input_description = if input.description.is_some() {
            Some(input.description.as_ref().unwrap().to_string())
         } else {
            None
         }; 
         let input_name = name.to_string(); 
         let input_ty = Box::new(resolve_type(context.clone(), input.ty.item_type().clone()));
         let input_description = if description.is_some() {
              Some(input.description.as_ref().unwrap().to_string())
         } else {
            None
         };
         let input_default_value = if input.default_value.is_some() {
             let default_value = input.default_value.as_ref().unwrap().to_string();
             Some(default_value)
         } else {
            None
         };
        let input_definition = Box::new(InputValueDefinition {
            description: input_description,
            name: input_name,
            ty: input_ty,
            default_value: input_default_value
        });
        inputs.insert(name.to_string(), input_definition);
    }
    let input_object_type = Node::new(InputObjectType {
        description, 
        name: name.clone(),
        fields: inputs
    });
    context.add_input(name.clone(), input_object_type);
    let type_ref = TypeRef::new(context.clone(), name.clone()); 
    return type_ref;
} 
     

#[allow(unused)]
fn resolve_scalar(
    context: SharedSchemaContext,
    name: String,
    origin: Node<apollo_schema::ScalarType>,
) -> TypeRef {
    // Check if the type is already resolved
    if context.get_type(&name).is_some() {
        return TypeRef::new(context.clone(), name);
    }
    let description = origin.description.as_ref().map(|v| v.to_string());
    let scalar = Node::new(ScalarType {
        name: name.clone(),
        description,
    });
    context.add_scalar(name.clone(), scalar).unwrap();
    TypeRef::new(context.clone(), name)
}

fn resolve_object(
    context: SharedSchemaContext,
    name: String,
    origin: apollo_compiler::Node<apollo_schema::ObjectType>,
) -> TypeRef {
    // Check if the type is already resolved
    if context.get_type(&name).is_some() {
        return TypeRef::new(context.clone(), name);
    }
    let mut fields = Vec::new();
    for (name, field) in origin.fields.iter() {
        let name = name.to_string();
        let ty = resolve_type(context.clone(), field.ty.clone());
        let description = field.description.as_ref().map(|v| v.to_string());
        let arguments = vec![];
        fields.push(FieldDefinition {
            name,
            ty,
            description,
            arguments,
        });
    }
    #[allow(clippy::mutable_key_type)]
    let fields: HashSet<_> = fields.into_iter().collect();
    let description = origin.description.as_ref().map(|v| v.to_string());
    let object = Node::new(ObjectType {
        name: name.clone(),
        description,
        fields,
        implements_interfaces: HashSet::new(),
    });
    context.add_object(name.clone(), object).unwrap();
    TypeRef::new(context.clone(), name)
}

pub fn resolve_type(context: SharedSchemaContext, origin: apollo_schema::Type) -> FieldType {
    match origin {
        apollo_schema::Type::Named(named) => {
            FieldType::Named(TypeRef::new(context, named.to_string()))
        }
        apollo_schema::Type::NonNullNamed(non_null) => {
            FieldType::NonNullNamed(TypeRef::new(context, non_null.as_str().to_string()))
        }
        apollo_schema::Type::List(of_type) => {
            FieldType::List(Box::new(resolve_type(context, *of_type)))
        }
        apollo_schema::Type::NonNullList(of_type) => {
            FieldType::NonNullList(Box::new(resolve_type(context, *of_type)))
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    fn setup() {
        simple_logger::init().unwrap();
    }
    #[test]
    fn test_query_type_resolve() {
        setup();
        let schema = r#"
            type Query{
                hello: String
            }
        "#
        .to_string();
        let ctx = resolve(&schema).unwrap();

        let object = ctx.get_type("Query");
        assert_eq!(object.is_some(), true);
        let obj = object.unwrap().object();
        assert_eq!(obj.is_some(), true);
        let obj = obj.unwrap();
        assert_eq!(obj.name, "Query");
        assert_eq!(obj.fields.len(), 1);
        let field = obj.get_field("hello");
        assert_eq!(field.is_some(), true);
    }
    #[test]
    fn resolve_simple_field_types() {
        let schema = r#"
            type Query{
                hello: String!
                world: Int!
                id: ID!
                foo: Float
            }
        "#
        .to_string();
        let ctx = resolve(&schema).unwrap();

        let object = ctx.get_type("Query").unwrap().object().unwrap();

        let hello_field = object.get_field("hello").unwrap();
        assert_eq!(hello_field.ty.get_scalar().unwrap().is_string(), true);
        let world_field = object.get_field("world").unwrap();
        assert_eq!(world_field.ty.get_scalar().unwrap().is_int(), true);
        let id_field = object.get_field("id").unwrap();
        assert_eq!(id_field.ty.get_scalar().unwrap().is_id(), true);
        let foo_field = object.get_field("foo").unwrap();
        assert_eq!(foo_field.ty.get_scalar().unwrap().is_float(), true);
        // optional
        assert_eq!(foo_field.ty.is_nullable(), true);
    }
}
