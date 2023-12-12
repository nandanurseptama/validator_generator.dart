import '../validator_annotation.dart';

typedef ObjectValidatorValidateFunction = ValidationResult Function(
  dynamic value,
);
typedef ObjectValidatorErrorMessageBuilder = String Function(
  String fieldName,
  String errorMessage,
);

class ObjectValidator extends ValidatorAnnotation {
  final ObjectValidatorValidateFunction validateFunction;
  final ObjectValidatorErrorMessageBuilder? errorMessageBuilder;

  const ObjectValidator({
    super.fieldName,
    required this.validateFunction,
    this.errorMessageBuilder,
  }) : super(
          name: 'ObjectValidator',
        );

  @override
  String get defaultErrorMessage => 'not an valid object';

  @override
  bool isValid(dynamic value) => true;

  @override
  String? validate(dynamic value) {
    final validationResult = validateFunction(
      value,
    );
    if (validationResult.isError) {
      return errorMessageBuilder == null
          ? validationResult.firstErrorToString
          : errorMessageBuilder!(
              validationResult.firstError.fieldName,
              validationResult.firstError.errorMessage,
            );
    }
    return null;
  }
}
