import '../../utils/utils.dart';
import '../annotations.dart';

/// Metadata validator check if instance of [String]
/// has length between [maxLength] and [minLength]
///
/// [minLength] & [maxLength] have to higher than zero
///
/// [minLength] should be lower than [maxLength]
///
/// return `false` if `length` lower or equal to zero
///
/// return `false` if value is [String]
///
/// return `true` if `value.length` <= `length`
///
/// return `false` if `value.length` > `length
///
/// if value [Type] is not [String] it will throw an [Exception]
///
/// when [minLength] or [maxLength] lower or equal to zero,
/// it will throw an [Exception]
///
/// when [minLength] >= [maxLength] it will throw an [Exception]
class MinMaxStringLengthValidator extends ValidatorAnnotation {
  /// maximum length of string
  final int maxLength;

  /// minimum length of string
  final int minLength;

  const MinMaxStringLengthValidator({
    required this.minLength,
    required this.maxLength,
    super.fieldName,
    super.errorMessage,
  }) : super(
          name: 'MinMaxStringLengthValidator',
        );

  @override
  String get defaultErrorMessage =>
      'value length should be between $minLength & $maxLength';

  @override
  bool isValid(dynamic value) {
    assertNullableString(
      value: value,
    );
    return validateMinMaxStringLength(
      minLength: minLength,
      maxLength: maxLength,
      value: value as String,
    );
  }
}
