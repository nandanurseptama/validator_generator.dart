/// Asserts that the given [value] is a String, 
/// and optionally allows null if specified.
///
/// If [allowNullable] is set to `true` and the [value] is `null`, 
/// the assertion passes.
/// If [allowNullable] is `false` (default) and the [value] is not a String or 
/// [Null], an exception is thrown.
///
/// This function is useful for enforcing type constraints in cases where a 
/// String is expected.
///
/// Example:
/// ```dart
/// void main() {
///   // Example 1: Value is a String
///   assertNullableString(value: 'test'); // No exception is thrown
///
///   // Example 2: Value is a nullable String
///   assertNullableString(value: null, allowNullable: true); // No exception is thrown
///   assertNullableString(value: 'test', allowNullable: true); // No exception is thrown
///
///   // Example 3: Value is not a String (Exception is thrown)
///   try {
///     assertNullableString(value: 42);
///   } catch (e) {
///     print(e); // Output: Exception: Expected a String but received an int
///   }
/// }
/// ```
void assertNullableString({
  dynamic value,
  bool allowNullable = false,
}) {
  if (allowNullable && value == null) {
    return;
  }
  if (value is String) {
    return;
  }
  throw Exception(
    'Expected a String but received a ${value.runtimeType}',
  );
}
