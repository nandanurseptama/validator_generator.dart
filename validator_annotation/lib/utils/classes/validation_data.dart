import '../../annotations/annotations.dart';

/// Represents data used for validation, including the value to be validated
/// and a list of validator annotation.
class ValidationData {
  /// property or method of instance symbol
  final String instanceMemberSymbol;

  /// The value to be validated.
  final dynamic valueToValidate;

  /// List of validator annotation.
  final List<ValidatorAnnotation> annotations;

  /// Creates an instance of [ValidationData].
  ///
  /// The [valueToValidate] is the value that needs to be validated,
  /// and [annotations] is a list
  /// of validator annotations associated with the value.
  ///
  /// Example:
  /// ```dart
  /// var data = ValidationData(
  ///   valueToValidate: "Hello, World!",
  ///   decorators: [StringLengthValidator(minLength: 5, maxLength: 20)],
  /// );
  /// ```
  const ValidationData({
    required this.instanceMemberSymbol,
    required this.valueToValidate,
    required this.annotations,
  });
}
