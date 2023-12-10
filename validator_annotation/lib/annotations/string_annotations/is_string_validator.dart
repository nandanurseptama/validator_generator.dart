import 'package:validator_annotation/annotations/base_validator_annotation.dart';
import 'package:validator_annotation/utils/utils.dart';

/// Metadata validator to check if value is instance of [String]
///
/// when [allowNullable] is true, will allow null value
///
/// if value [Type] is not [String] it will return `false`
class IsStringValidator extends ValidatorAnnotation {
  final bool allowNullable;
  const IsStringValidator({
    super.errorMessage,
    super.fieldName,
    this.allowNullable = true,
  }) : super(
          name: "IsString",
        );

  @override
  String get defaultErrorMessage => "is not String";

  @override
  bool validate(value) {
    try {
      assertNullableString(
        value: value,
        allowNullable: allowNullable,
      );
      return true;
    } catch (error) {
      return false;
    }
  }
}

/// shortcut for [IsStringValidator] decorator without parameter
const isStringValidator = IsStringValidator();
