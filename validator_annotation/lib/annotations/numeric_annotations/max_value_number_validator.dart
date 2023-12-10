import 'package:validator_annotation/annotations/annotations.dart';
import 'package:validator_annotation/utils/utils.dart';

/// Validator metadata to check if a number lower than or equal to [value]
///
/// when `value` is not [num], it will throw exception
class MaxValueNumberValidator extends ValidatorAnnotation {
  final num value;
  const MaxValueNumberValidator({
    super.fieldName,
    super.errorMessage,
    required this.value,
  }) : super(
          name: "MaxValueNumberValidator",
        );

  @override
  String get defaultErrorMessage => "must lower than or equal to $value";

  /// throw an exception when `value` is not [num]
  @override
  bool validate(value) {
    assertNumeric(
      allowNullable: false,
      value: value,
    );
    value as num;
    return validateMaxValue(
      value: value,
      maxValue: this.value,
    );
  }
}
