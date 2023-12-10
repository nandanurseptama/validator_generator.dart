/// validate if [value] is not negative
///
/// it means [value] higher than -1
bool validateIsNotNegative<T extends num>(T value) {
  return value >= 0;
}
