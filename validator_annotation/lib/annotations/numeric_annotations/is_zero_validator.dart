import '../../utils/utils.dart';
import '../annotations.dart';

/// Validator metadata to check if number is zero
///
/// when `value` is not [num], it will throw exception
class IsZeroValidator extends ValidatorAnnotation {
  const IsZeroValidator({
    super.fieldName,
    super.errorMessage,
  }) : super(
          name: 'IsZeroValidator',
        );

  @override
  String get defaultErrorMessage => 'must be positive';

  /// return `true` if value is zero
  ///
  /// throw an exception when `value` is not [num]
  @override
  bool isValid(dynamic value) {
    assertNumeric(
      value: value,
    );
    value as num;
    return !validateIsNotZero(
      value,
    );
  }
}

/// shortcut for [IsZeroValidator]
const isZeroValidator = IsZeroValidator();
