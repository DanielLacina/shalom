
use apollo_compiler::{validation::Valid, ExecutableDocument};

use crate::schema::context::SharedSchemaContext;

pub mod resolver;
pub(crate) mod context;
pub mod types;

struct OperationsContext {
    schema: SharedSchemaContext,
    operation: Valid<ExecutableDocument>,
}

impl OperationsContext {
    pub fn new(schema: SharedSchemaContext, operation: Valid<ExecutableDocument>) -> Self {
        Self { schema, operation }
    }
}

impl OperationsContext {
    pub fn operation(&self) -> &Valid<ExecutableDocument> {
        &self.operation
    }
}
