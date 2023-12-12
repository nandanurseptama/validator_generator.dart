import 'validate_is_positive.dart';

/// validate if [value] is not positive
///
/// it means [value] lower than one
bool validateIsNotPositive<T extends num>(T value) => !validateIsPositive(
      value,
    );
