import '../../utils/utils.dart';

import '../annotations.dart';

/// Validator metadata to check if number is positive
///
/// when `value` is not [num], it will throw exception
class IsPositiveNumberValidator extends ValidatorAnnotation {
  const IsPositiveNumberValidator({
    super.fieldName,
    super.errorMessage,
  }) : super(
          name: 'IsPositiveNumberValidator',
        );

  @override
  String get defaultErrorMessage => 'must be positive';

  /// return `true` if value is positive
  ///
  /// throw an exception when `value` is not [num]
  @override
  bool isValid(dynamic value) {
    assertNumeric(
      value: value,
    );
    value as num;
    return validateIsPositive(
      value,
    );
  }
}

/// shortcut for [IsPositiveNumberValidator]
const isPositiveNumberValidator = IsPositiveNumberValidator();
