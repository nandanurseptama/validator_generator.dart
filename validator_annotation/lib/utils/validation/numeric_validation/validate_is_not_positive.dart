import 'package:validator_annotation/utils/validation/numeric_validation/validate_is_positive.dart';

/// validate if [value] is not positive
///
/// it means [value] lower than one
bool validateIsNotPositive<T extends num>(T value) {
  return !validateIsPositive(value);
}
