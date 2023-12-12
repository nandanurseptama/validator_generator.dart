import 'package:test/test.dart';
import 'package:validator_annotation/utils/functions/assert_nullable_string.dart';

void main() {
  test('assertNullableString should not throw exception for String', () {
    expect(() => assertNullableString(value: 'test'), returnsNormally);
  });

  test('assertNullableString should not throw exception for nullable String',
      () {
    expect(() => assertNullableString(allowNullable: true), returnsNormally);
    expect(
      () => assertNullableString(value: 'test', allowNullable: true),
      returnsNormally,
    );
  });

  test(
      '''assertNullableString should throw exception for nullable string when allowNullable is false''',
      () {
    expect(
      assertNullableString,
      throwsA(isA<Exception>()),
    );
  });

  test('assertNullableString should throw exception for non-String types', () {
    expect(
      () => assertNullableString(value: 42),
      throwsA(isA<Exception>()),
    );

    expect(
      () => assertNullableString(value: 3.14),
      throwsA(isA<Exception>()),
    );

    expect(
      () => assertNullableString(value: true),
      throwsA(isA<Exception>()),
    );
  });
}
