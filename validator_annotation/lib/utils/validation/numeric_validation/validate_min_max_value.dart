/// validate if [value] >= [minValue] and [value] <= [maxValue]
///
/// [minValue] should lower than [maxValue]
bool validateMinMaxValue<T extends num>({
  required T value,
  required T minValue,
  required T maxValue,
}) {
  if (minValue >= maxValue) {
    throw Exception(
      "minValue should lower than maxValue. The value you supllied are minValue=$minValue & maxValue=$maxValue",
    );
  }
  return value >= minValue && value <= maxValue;
}

/// validate if [value] <= [maxValue]
bool validateMaxValue<T extends num>({
  required T value,
  required T maxValue,
}) {
  return value <= maxValue;
}

/// validate if [value] >= [minValue]
bool validateMinValue<T extends num>({
  required T value,
  required T minValue,
}) {
  return value >= minValue;
}
