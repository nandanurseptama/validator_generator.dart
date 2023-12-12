import '../../utils/utils.dart';
import '../annotations.dart';

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
          name: 'MinValueNumberValidator',
        );

  @override
  String get defaultErrorMessage => 'must higher than or equal to $value';

  /// throw an exception when `value` is not [num]
  @override
  bool isValid(dynamic value) {
    assertNumeric(
      value: value,
    );
    value as num;
    return validateMinValue(
      value: value,
      minValue: this.value,
    );
  }
}
