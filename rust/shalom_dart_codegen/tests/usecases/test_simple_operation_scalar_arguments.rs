use crate::run_dart_tests_for_usecase;

static USE_CASE_NAME: &str = "simple_operation_scalar_arguments";
#[test]
fn test_simple_operation_scalar_arguments_dart() {
    run_dart_tests_for_usecase(USE_CASE_NAME);
}
