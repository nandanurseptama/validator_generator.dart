import '../../utils/utils.dart';
import '../annotations.dart';

/// [IsNotEmptyStringValidator] Decorator
///
/// Check if an [String] instance is not empty
///
/// [trimWhiteSpace] if true the
/// whitespace and tab will be replaced by empty string
///
/// if value [Type] is not [String] it will throw an [Exception]
class IsNotEmptyStringValidator extends ValidatorAnnotation {
  final bool trimWhiteSpace;

  const IsNotEmptyStringValidator({
    super.errorMessage,
    super.fieldName,
    this.trimWhiteSpace = false,
  }) : super(
          name: 'IsNotEmptyStringValidator',
        );

  @override
  String get defaultErrorMessage => 'is empty';

  @override
  bool isValid(dynamic value) {
    assertNullableString(
      value: value,
      allowNullable: true,
    );
    value as String?;
    return !validateIsEmpty(
      value: value,
      excludeWhiteSpace: trimWhiteSpace,
    );
  }
}

/// shortcut for [IsNotEmptyStringValidator] decorator without parameter
const isNotEmptyStringValidator = IsNotEmptyStringValidator();
