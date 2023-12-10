import '../../utils/utils.dart';
import '../annotations.dart';

/// Metadata validator check if instance of [String] has maximum of [length]
///
/// [length] have to higher than zero
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
/// if [length] <= 0, it will throw an [Exception]
class MaxStringLengthValidator extends ValidatorAnnotation {
  /// maximum length of string
  final int length;

  const MaxStringLengthValidator({
    required this.length,
    super.fieldName,
    super.errorMessage,
  }) : super(
          name: 'MaxStringLengthValidator',
        );

  @override
  String get defaultErrorMessage =>
      'value length should be lower or equal to `$length`';

  @override
  bool validate(dynamic value) {
    assertNullableString(
      value: value,
    );
    return validateMaxStringLength(
      length: length,
      value: value as String,
    );
  }
}
