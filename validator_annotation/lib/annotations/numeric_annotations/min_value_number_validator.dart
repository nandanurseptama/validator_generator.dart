import 'package:validator_annotation/annotations/annotations.dart';
import 'package:validator_annotation/utils/utils.dart';

/// Validator metadata to check if a number higher than or equal to [value]
///
/// when `value` is not [num], it will throw exception
class MinValueNumberValidator extends ValidatorAnnotation {
  final num value;
  const MinValueNumberValidator({
    super.fieldName,
    super.errorMessage,
    required this.value,
  }) : super(
          name: "MinValueNumberValidator",
        );

  @override
  String get defaultErrorMessage => "must higher than or equal to $value";

  /// throw an exception when `value` is not [num]
  @override
  bool validate(value) {
    assertNumeric(
      allowNullable: false,
      value: value,
    );
    value as num;
    return validateMinValue(
      value: value,
      minValue: this.value,
    );
  }
}
