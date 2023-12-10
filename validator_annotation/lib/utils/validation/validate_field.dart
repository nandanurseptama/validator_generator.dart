import 'package:validator_annotation/validator_annotation.dart';

/// Validates a field using a list of [ValidatorAnnotation] annotations.
///
/// The [validateField] function takes a [value] and a list of [annotations],
/// and iterates through each annotation to validate the provided value.
/// If any validation fails, the function returns the error message
/// associated with the first failing validation. If all validations pass,
/// it returns null.
///
/// If the [annotations] list is empty, the function returns null immediately
/// since there are no validations to perform.
///
/// The [ValidatorAnnotation] is an interface that should be implemented by
/// specific validation classes. Each validation class must provide a
/// `validate` method that takes the value to be validated and returns a boolean
/// indicating whether the validation passed or failed. Additionally, a custom
/// error message should be provided through the `errorMessage` property of
/// the [ValidatorAnnotation] instance.
///
/// Example Usage:
/// ```dart
/// String? result = validateField(
///   inputValue,
///   [
///     IsNotEmptyStringValidator(errorMessage: 'Value is required.'),
///     MinStringLengthValidator(length: 5, errorMessage: 'Must be at least 5 characters.'),
///   ],
/// );
/// ```
///
/// In this example, the function performs validations for requiredness and
/// minimum length, returning the first error message encountered or null
/// if all validations pass.
String? validateField(
  dynamic value,
  List<ValidatorAnnotation> annotations,
) {
  if (annotations.isEmpty) {
    return null;
  }
  for (final annotation in annotations) {
    final isError = annotation.validate(value);
    if (isError) {
      return annotation.errorMessage;
    }
  }
  return null;
}
