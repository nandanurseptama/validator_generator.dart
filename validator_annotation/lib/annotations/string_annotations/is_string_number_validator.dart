import '../../utils/utils.dart';
import '../annotations.dart';

/// validate is instance of [String] is number or not
///
/// if value [Type] is not [String] it will throw an [Exception]
class IsStringNumberValidator extends ValidatorAnnotation {
  const IsStringNumberValidator({
    super.errorMessage,
    super.fieldName,
  }) : super(
          name: 'IsStringNumberValidator',
        );

  @override
  String get defaultErrorMessage => 'is not string number';

  @override
  bool isValid(dynamic value) {
    assertNullableString(
      value: value,
    );
    return validateIsStringNumber(
      value: value as String,
    );
  }
}

/// shortcut for [IsStringNumberValidator] decorator without parameter
const isStringNumberValidator = IsStringNumberValidator();
