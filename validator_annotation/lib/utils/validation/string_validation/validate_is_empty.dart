import '../../extensions/string_extension.dart';

/// check if the [value] is empty or not
///
/// when [value] is null or [value] length is zero, it will return true
///
/// when [excludeWhiteSpace] is true all white space will
/// be replaced by string empty
bool validateIsEmpty({
  String? value,
  bool excludeWhiteSpace = true,
}) {
  if (value == null) {
    return true;
  }
  if (excludeWhiteSpace) {
    value = value.removeWhiteSpace();
  }
  return value.isEmpty;
}
