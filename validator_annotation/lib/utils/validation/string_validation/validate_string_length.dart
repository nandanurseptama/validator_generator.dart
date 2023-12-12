/// validate is string [value] have min length >= [length]
bool validateMinStringLength({
  required int length,
  required String value,
}) {
  if (length <= 0) {
    throw Exception(
      '''length should be higher than zero. The value you supplied length=$length''',
    );
  }
  return value.length >= length;
}

/// validate is string [value] have max length <= [length]
bool validateMaxStringLength({
  required int length,
  required String value,
}) {
  if (length <= 0) {
    throw Exception(
      '''length should be higher than zero. The value you supplied length=$length''',
    );
  }
  return value.length <= length;
}

/// validate is string [value] length >= [minLength] and <= [maxLength]
///
/// [maxLength] should be higher than [minLength]
///
/// [maxLength] & [minLength] should be higher than zero
///
/// 0 < [minLength] < [maxLength]
bool validateMinMaxStringLength({
  required int minLength,
  required int maxLength,
  required String value,
}) {
  if (minLength <= 0 || maxLength <= 0) {
    throw Exception(
      '''minLength & maxLength should be higher than zero. The value you supplied minLength=$minLength, maxLength=$maxLength''',
    );
  }

  if (minLength >= maxLength) {
    throw Exception(
      '''minLength should be lower than maxLength. The value you supplied minLength=$minLength, maxLength=$maxLength''',
    );
  }
  return value.length >= minLength && value.length <= maxLength;
}
