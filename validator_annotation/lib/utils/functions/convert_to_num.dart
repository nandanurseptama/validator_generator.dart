import '../utils.dart';

num convertToNum(dynamic value) {
  if (value is String) {
    try {
      return num.parse(value);
    } catch (e) {
      throw Exception(
        'not valid number',
      );
    }
  }
  assertNumeric(
    value: value,
  );
  return value as num;
}
