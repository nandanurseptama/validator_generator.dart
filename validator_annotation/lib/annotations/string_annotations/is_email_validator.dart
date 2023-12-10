import '../../utils/utils.dart';
import '../../utils/validation/string_validation/validate_is_email.dart';
import '../annotations.dart';

/// [IsEmailValidator] is metadata validator to check email address
class IsEmailValidator extends ValidatorAnnotation {
  const IsEmailValidator({
    super.fieldName,
    super.errorMessage,
  }) : super(
          name: 'IsEmailValidator',
        );

  @override
  String get defaultErrorMessage => 'not email';

  @override
  bool validate(dynamic value) {
    assertNullableString(
      allowNullable: true,
      value: value,
    );
    if (value == null) {
      return false;
    }
    return validateIsEmail(
      value as String,
    );
  }
}
