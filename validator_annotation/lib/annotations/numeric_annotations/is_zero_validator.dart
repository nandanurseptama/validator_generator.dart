import 'package:validator_annotation/annotations/annotations.dart';
import 'package:validator_annotation/utils/utils.dart';

/// Validator metadata to check if number is zero
///
/// when `value` is not [num], it will throw exception
class IsZeroValidator extends ValidatorAnnotation {
  const IsZeroValidator({
    super.fieldName,
    super.errorMessage,
  }) : super(
          name: "IsZeroValidator",
        );

  @override
  String get defaultErrorMessage => "must be positive";

  /// return `true` if value is zero
  ///
  /// throw an exception when `value` is not [num]
  @override
  bool validate(value) {
    assertNumeric(
      allowNullable: false,
      value: value,
    );
    value as num;
    return !validateIsNotZero(
      value,
    );
  }
}

/// shortcut for [IsZeroValidator]
const isZeroValidator = IsZeroValidator();
