use std::{
    collections::HashMap,
    sync::{Arc, Mutex},
};

use crate::{operation::context::SharedOpCtx, schema::context::SharedSchemaContext};

#[derive(Debug)]
pub struct ShalomGlobalContext {
    operations: Mutex<HashMap<String, SharedOpCtx>>,
    pub schema_ctx: SharedSchemaContext,
}

unsafe impl Send for ShalomGlobalContext {}
unsafe impl Sync for ShalomGlobalContext {}

impl ShalomGlobalContext {
    pub fn new(schema_ctx: SharedSchemaContext) -> Arc<Self> {
        Arc::new(Self {
            operations: Mutex::new(HashMap::new()),
            schema_ctx,
        })
    }
    pub fn register_operations(&self, operations_update: HashMap<String, SharedOpCtx>) {
        let mut operations = self.operations.lock().unwrap();
        for (name, _) in operations_update.iter() {
            if operations.contains_key(name) {
                panic!("Operation with name {} already exists", name);
            }
        }
        operations.extend(operations_update);
    }
    pub fn operations(&self) -> Vec<(String, SharedOpCtx)> {
        let operations = self.operations.lock().unwrap();
        operations
            .iter()
            .map(|(name, op)| (name.clone(), op.clone()))
            .collect()
    }

    pub fn operation_exists(&self, name: &str) -> bool {
        let operations = self.operations.lock().unwrap();
        operations.contains_key(name)
    }
}
pub type SharedShalomGlobalContext = Arc<ShalomGlobalContext>;
