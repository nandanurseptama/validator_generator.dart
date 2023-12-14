import '../../utils/functions/convert_to_num.dart';
import '../../utils/utils.dart';
import '../annotations.dart';

/// Validator metadata to check
/// if a number value between [minValue] and [maxValue]
///
/// [minValue] <= `value` <= [maxValue] and [maxValue] > [minValue]
///
/// [maxValue] should be higher than [minValue]
///
/// when `value` is not [num], it will throw exception
class MinMaxValueNumberValidator extends ValidatorAnnotation {
  final num minValue;
  final num maxValue;
  const MinMaxValueNumberValidator({
    super.fieldName,
    super.errorMessage,
    required this.minValue,
    required this.maxValue,
  }) : super(
          name: 'MinMaxValueNumberValidator',
        );

  @override
  String get defaultErrorMessage =>
      'value must be between $minValue and $maxValue';

  /// throw an exception when `value` is not [num]
  @override
  bool isValid(dynamic value) => validateMinMaxValue(
        value: convertToNum(value),
        minValue: minValue,
        maxValue: maxValue,
      );
}
