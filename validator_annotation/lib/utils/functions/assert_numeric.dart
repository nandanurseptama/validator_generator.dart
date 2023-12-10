void assertNumeric({
  dynamic value,
  bool allowNullable = false,
}) {
  if (value == null && allowNullable) {
    return;
  }
  if (value is! num) {
    throw Exception(
      "Expected value is a num but received a ${value.runtimeType}",
    );
  }
  return;
}
