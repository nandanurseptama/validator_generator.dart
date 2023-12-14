void assertNumeric({
  dynamic value,
  bool allowNullable = false,
}) {
  if (value == null && allowNullable) {
    return;
  }
  if (value is! num) {
    throw Exception(
      'not valid number',
    );
  }
  return;
}
