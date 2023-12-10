import 'package:validator_annotation/annotations/annotations.dart';
import 'package:validator_annotation/utils/utils.dart';

/// Validator metadata to check if number is negative
///
/// when `value` is not [num], it will throw exception
class IsNegativeNumberValidator extends ValidatorAnnotation {
  const IsNegativeNumberValidator({
    super.fieldName,
    super.errorMessage,
  }) : super(
          name: "IsNegativeNumberValidator",
        );

  @override
  String get defaultErrorMessage => "must be negative";

  /// return `true` if value is negative
  ///
  /// throw an exception when `value` is not [num]
  @override
  bool validate(value) {
    assertNumeric(
      allowNullable: false,
      value: value,
    );
    value as num;
    return validateIsNegative(
      value,
    );
  }
}

/// shortcut for [IsNegativeNumberValidator]
const isNegativeNumberValidator = IsNegativeNumberValidator();
