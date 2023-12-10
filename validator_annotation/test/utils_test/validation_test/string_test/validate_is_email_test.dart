import 'package:test/test.dart';
import 'package:validator_annotation/utils/validation/string_validation/validate_is_email.dart';

void main() {
  group('Email Validation', () {
    test('Valid Email', () {
      expect(validateIsEmail("test@example.com"), isTrue);
    });

    test('Valid Email with Subdomain', () {
      expect(validateIsEmail("user123@gmail.co.uk"), isTrue);
    });

    test('Valid Email with Underscore', () {
      expect(validateIsEmail("john_doe123@my-mail.org"), isTrue);
    });

    test('Invalid Email (Missing @ and Domain)', () {
      expect(validateIsEmail("invalid-email"), isFalse);
    });

    test('Invalid Email (Empty Domain)', () {
      expect(validateIsEmail("user@.com"), isFalse);
    });

    test('Invalid Email (Double Dots in Domain)', () {
      expect(validateIsEmail("user@company..com"), isFalse);
    });

    test('Invalid Email (Special Character ! in Domain)', () {
      expect(validateIsEmail("user@company!com"), isFalse);
    });
  });
}
