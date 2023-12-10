import 'package:validator_annotation/validator_annotation.dart';

ValidationResult validateInstance(
  List<ValidationData> validationDatas,
  ValidatorOptions options,
) {
  final stopFirstError = options.stopWhenFirstError;
  final validationErrors = List<ValidationError>.empty(
    growable: true,
  );
  for (final validationData in validationDatas) {
    final valueToValidate = validationData.valueToValidate;
    for (final validationMetadata in validationData.annotations) {
      final isError = validationMetadata.validate(valueToValidate);
      if (isError && stopFirstError) {
        final validationError = ValidationError(
          fieldName: validationMetadata.fieldName ??
              validationData.instanceMemberSymbol,
          originalValue: valueToValidate,
          errorMessage: validationMetadata.errorMessage,
        );
        return ValidationResult(
          errors: [
            validationError,
          ],
          validatorOptions: options,
          validationData: validationDatas,
        );
      }
      if (isError) {
        final validationError = ValidationError(
          fieldName: validationMetadata.fieldName ??
              validationData.instanceMemberSymbol,
          originalValue: valueToValidate,
          errorMessage: validationMetadata.errorMessage,
        );
        validationErrors.add(
          validationError,
        );
      }
    }
  }
  return ValidationResult(
    errors: validationErrors,
    validatorOptions: options,
    validationData: validationDatas,
  );
}
