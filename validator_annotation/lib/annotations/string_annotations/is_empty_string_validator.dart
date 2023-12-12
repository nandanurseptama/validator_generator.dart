import '../../utils/utils.dart';
import '../annotations.dart';

/// [IsEmptyStringValidator] Decorator
///
/// Check if an [String] instance is empty or not
///
/// [trimWhiteSpace] if true the whitespace and
/// tab will be replaced by empty string
///
/// [allowNullable] if `true`, null will be considered as empty string
///
/// if value [Type] is not [String] it will throw an [Exception]
class IsEmptyStringValidator extends ValidatorAnnotation {
  final bool trimWhiteSpace;

  final bool allowNullable;

  const IsEmptyStringValidator({
    super.errorMessage,
    super.fieldName,
    this.trimWhiteSpace = false,
    this.allowNullable = true,
  }) : super(
          name: 'IsEmptyStringValidator',
        );

  @override
  String get defaultErrorMessage => 'is not empty';

  @override
  bool isValid(dynamic value) {
    assertNullableString(
      value: value,
      allowNullable: allowNullable,
    );
    value as String?;
    return validateIsEmpty(
      value: value,
      excludeWhiteSpace: trimWhiteSpace,
    );
  }
}

/// shortcut for [IsEmptyStringValidator] decorator without parameter
const isEmptyStringValidator = IsEmptyStringValidator();
