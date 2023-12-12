import '../../utils/utils.dart';
import '../annotations.dart';

/// Metadata validator check if instance of [String] has minimum of [length]
///
/// [length] have to higher than zero
///
/// return `false` if `length` lower or equal to zero
///
/// return `false` if value is [String]
///
/// return `true` if `value.length` >= `length`
///
/// return `false` if `value.length` < `length
///
/// if value [Type] is not [String] it will throw an [Exception]
///
/// if [length] <= 0, it will throw an [Exception]
class MinStringLengthValidator extends ValidatorAnnotation {
  /// minimum length of string
  final int length;

  const MinStringLengthValidator({
    required this.length,
    super.fieldName,
    super.errorMessage,
  }) : super(
          name: 'MinStringLengthValidator',
        );

  @override
  String get defaultErrorMessage =>
      'value length should be higher or equal to `$length`';

  @override
  bool isValid(dynamic value) {
    assertNullableString(
      value: value,
    );
    return validateMinStringLength(
      length: length,
      value: value as String,
    );
  }
}
