import 'bool_helpers.dart';
import 'string_helpers.dart';

String createStaticFunctionNameFromFieldName(String fieldName) {
  if (isCamelCase(fieldName)) {
    fieldName = upperFirstLetter(fieldName);
    return 'validate$fieldName';
  }

  if (isPascalCase(fieldName)) {
    return 'validate$fieldName';
  }

  if (isSnakeCase(
    fieldName,
  )) {
    return 'validate_$fieldName';
  }

  return 'validate$fieldName';
}
 