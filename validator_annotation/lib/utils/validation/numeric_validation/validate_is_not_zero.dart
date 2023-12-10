/// validate if [value] lower than zero or higher than zero
bool validateIsNotZero<T extends num>(T value) {
  return value > 0 || value < 0;
}
