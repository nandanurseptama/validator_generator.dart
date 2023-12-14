import '../../utils/functions/convert_to_num.dart';
import '../../utils/utils.dart';
import '../annotations.dart';

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
          name: 'MaxValueNumberValidator',
        );

  @override
  String get defaultErrorMessage => 'must lower than or equal to $value';

  /// throw an exception when `value` is not [num]
  @override
  bool isValid(dynamic value) => validateMaxValue(
        value: convertToNum(
          value,
        ),
        maxValue: this.value,
      );
}
