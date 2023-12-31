import '../../utils/functions/convert_to_num.dart';
import '../../utils/utils.dart';
import '../annotations.dart';

/// Validator metadata to check if number is negative
///
/// when `value` is not [num], it will throw exception
class IsNegativeNumberValidator extends ValidatorAnnotation {
  const IsNegativeNumberValidator({
    super.fieldName,
    super.errorMessage,
  }) : super(
          name: 'IsNegativeNumberValidator',
        );

  @override
  String get defaultErrorMessage => 'must be negative';

  /// return `true` if value is negative
  ///
  /// throw an exception when `value` is not [num]
  @override
  bool isValid(dynamic value) => validateIsNegative(
        convertToNum(value),
      );
}

/// shortcut for [IsNegativeNumberValidator]
const isNegativeNumberValidator = IsNegativeNumberValidator();
