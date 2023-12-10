/// validate is string value can be parsed to numeric or not
bool validateIsStringNumber({
  required String value,
}) {
  if (num.tryParse(value) == null) {
    return false;
  }
  return true;
}

/// validate is string value can be parsed to integer or not
bool validateIsStringInteger({
  required String value,
}) {
  if (int.tryParse(value) == null) {
    return false;
  }
  return true;
}

/// validate is string value can be parsed to double or not
bool validateIsStringDouble({
  required String value,
}) {
  if (double.tryParse(value) == null) {
    return false;
  }
  return true;
}
