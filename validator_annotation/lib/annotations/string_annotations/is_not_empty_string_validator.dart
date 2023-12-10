import 'package:validator_annotation/annotations/annotations.dart';
import 'package:validator_annotation/utils/utils.dart';

/// [IsNotEmptyStringValidator] Decorator
///
/// Check if an [String] instance is not empty
///
/// [trimWhiteSpace] if true the whitespace and tab will be replaced by empty string
///
/// if value [Type] is not [String] it will throw an [Exception]
class IsNotEmptyStringValidator extends ValidatorAnnotation {
  final bool trimWhiteSpace;

  const IsNotEmptyStringValidator({
    super.errorMessage,
    super.fieldName,
    this.trimWhiteSpace = false,
  }) : super(
          name: "IsNotEmptyStringValidator",
        );

  @override
  String get defaultErrorMessage => "is empty";

  @override
  bool validate(dynamic value) {
    assertNullableString(
      value: value,
      allowNullable: false,
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
