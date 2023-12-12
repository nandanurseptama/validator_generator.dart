import '../../extensions/string_extension.dart';

import 'validate_is_empty.dart';

/// check if the [value] is alphabet or not
///
/// when [trimWhiteSpace] is true all
/// whitespace will be replaced by string empty
///
/// when [onlyAcceptLowerCase] is true only accept 'a-z' character
bool validateIsAlphabet({
  String? value,
  bool onlyAcceptLowerCase = false,
  bool allowMultiline = true,
  bool trimWhiteSpace = true,
}) {
  if (validateIsEmpty(
    value: value,
  )) {
    return false;
  }
  if (trimWhiteSpace) {
    value = value!.removeWhiteSpace();
  }

  var regex = RegExp(
    r'^[a-zA-Z]+$',
    multiLine: allowMultiline,
  );
  if (onlyAcceptLowerCase) {
    regex = RegExp(
      r'^[a-z]+$',
      multiLine: allowMultiline,
    );
  }

  return regex.hasMatch(
    value!,
  );
}
