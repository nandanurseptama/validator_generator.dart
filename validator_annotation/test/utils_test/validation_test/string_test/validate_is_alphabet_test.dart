import 'package:test/test.dart';
import 'package:validator_annotation/utils/utils.dart';

void main() {
  group('validateIsAlphabet', () {
    test('should return true for valid alphabets', () {
      expect(validateIsAlphabet(value: 'abc'), isTrue);
      expect(validateIsAlphabet(value: 'xyz'), isTrue);
      expect(validateIsAlphabet(value: 'ABC'), isTrue);
      expect(validateIsAlphabet(value: 'XYZ'), isTrue);
    });

    test(
        '''should return true for valid alphabets with whitespace when trimWhiteSpace is true''',
        () {
      expect(
        validateIsAlphabet(
          value: 'a b c',
        ),
        true,
      );
    });

    test(
        '''should return true for valid alphabets with newline when allowMultiline is true''',
        () {
      expect(
        validateIsAlphabet(value: 'a\nb\nc'),
        isTrue,
      );
    });

    test(
        '''should return true for valid alphabets with mixed case when onlyAcceptLowerCase is false''',
        () {
      expect(
        validateIsAlphabet(value: 'aBc'),
        isTrue,
      );
    });

    test(
        '''should return true for valid alphabets with mixed case and whitespace when trimWhiteSpace is true''',
        () {
      expect(
        validateIsAlphabet(
          value: 'a B c',
        ),
        isTrue,
      );
    });

    test('should return false for invalid alphabets with numbers', () {
      expect(validateIsAlphabet(value: 'abc123'), isFalse);
    });

    test('should return false for invalid alphabets with special characters',
        () {
      expect(validateIsAlphabet(value: 'a_b_c'), isFalse);
    });

    test('should return false for empty string', () {
      expect(validateIsAlphabet(value: ''), isFalse);
    });

    test('should return false for null value', () {
      expect(validateIsAlphabet(), isFalse);
    });

    test(
        '''should return false for invalid alphabets with whitespace when trimWhiteSpace is false''',
        () {
      expect(
        validateIsAlphabet(
          value: 'a b c',
          trimWhiteSpace: false,
        ),
        isFalse,
      );
    });

    test(
        '''should return false for invalid alphabets with newline when allowMultiline is false''',
        () {
      expect(
        validateIsAlphabet(
          value: 'a\nb\nc',
          allowMultiline: false,
        ),
        isFalse,
      );
    });

    test(
        '''should return false for invalid alphabets with mixed case when onlyAcceptLowerCase is true''',
        () {
      expect(
        validateIsAlphabet(
          value: 'aBc',
          onlyAcceptLowerCase: true,
        ),
        isFalse,
      );
    });
  });
}
