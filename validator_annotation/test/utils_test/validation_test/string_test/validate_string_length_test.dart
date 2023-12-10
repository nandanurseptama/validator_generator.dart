import 'package:validator_annotation/utils/validation/string_validation/validate_string_length.dart';
import 'package:test/test.dart';

void main() {
  late String positiveTestCase;

  setUpAll(() {
    positiveTestCase = "nanda";
  });

  group("Validate string length test", () {
    group("validate min length test", () {
      test(
        "when min length lower and equal to zero, should throw assertion error",
        () {
          var length = 0;

          expect(
            () => validateMinStringLength(
              length: length,
              value: positiveTestCase,
            ),
            throwsA(
              isA<Exception>(),
            ),
          );
        },
      );
      test(
        "when positive test case length higher than and equal to min length, should return true",
        () {
          var length = 5;
          expect(
            validateMinStringLength(
              length: length,
              value: positiveTestCase,
            ),
            true,
          );
        },
      );

      test(
        "when positive test case length lower than min length, should return false",
        () {
          var length = 8;

          expect(
            validateMinStringLength(
              length: length,
              value: positiveTestCase,
            ),
            false,
          );
        },
      );
    });

    group("validate max length test", () {
      late int positiveCaseMaxLength;
      late int negativeCaseMaxLength;
      setUp(() {
        positiveCaseMaxLength = 5;
        negativeCaseMaxLength = 3;
      });

      test(
        "when max length lower or equal to zero, should throws assertion error",
        () {
          var length = 0;
          expect(
            () => validateMaxStringLength(
              length: length,
              value: positiveTestCase,
            ),
            throwsA(
              isA<Exception>(),
            ),
          );
        },
      );

      test(
        "test case length lower or equal to maxLength, should return true",
        () {
          expect(
            validateMaxStringLength(
              length: positiveCaseMaxLength,
              value: positiveTestCase,
            ),
            true,
          );
        },
      );

      test(
        "test case length higher than maxLength, should return false",
        () {
          expect(
            validateMaxStringLength(
              length: negativeCaseMaxLength,
              value: positiveTestCase,
            ),
            false,
          );
        },
      );
    });

    group("validate max min length test", () {
      test(
        "When minLength or maxLength lower than or equal to zero, should throw assertion error",
        () {
          expect(
              () => validateMinMaxStringLength(
                    minLength: 0,
                    maxLength: 0,
                    value: positiveTestCase,
                  ),
              throwsA(
                isA<Exception>(),
              ));
        },
      );

      test(
        "When minLength higher or equal to maxLength, should throw assertion error",
        () {
          expect(
            () => validateMinMaxStringLength(
              minLength: 3,
              maxLength: 3,
              value: positiveTestCase,
            ),
            throwsA(
              isA<Exception>(),
            ),
          );
        },
      );

      test(
          "when test case value length higher or equal to minLength and lower or equal to maxLength, should return true",
          () {
        expect(
          validateMinMaxStringLength(
            minLength: 3,
            maxLength: 5,
            value: positiveTestCase,
          ),
          true,
        );
      });
    });
  });
}
