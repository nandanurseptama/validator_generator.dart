import 'package:validator_annotation/utils/validation/numeric_validation/validate_is_not_negative.dart';
import 'package:test/test.dart';

void main() {
  group("validate is negative test", () {
    late List<int> notNegativeInt;
    late List<double> notNegativeDouble;
    late List<num> notNegativeNum;

    late List<int> negativeInt;
    late List<double> negativeDouble;
    late List<num> negativeNum;

    setUpAll(() {
      notNegativeInt = [0, 11, 20000, 11111111];
      notNegativeDouble = [0.000001, 0.1, 10.0, 2000, 2000000.0];
      notNegativeNum = [
        0.0001,
        0.1,
        10.0,
        200000.0,
        1000000000.0,
      ];

      negativeInt = [-1, -11, -20000, -11111111];
      negativeDouble = [-0.000001, -0.1, -10.0, -2000, -2000000.0];
      negativeNum = [
        -0.0001,
        -0.1,
        -10.0,
        -200000.0,
        -1000000000.0,
      ];
    });

    test(
      "when value is not negative should return true",
      () {
        for (var i in [
          ...notNegativeNum,
          ...notNegativeDouble,
          ...notNegativeInt
        ]) {
          var result = validateIsNotNegative(
            i,
          );
          expect(
            result,
            true,
          );
        }
      },
    );
    test(
      "when value is negative should return false",
      () {
        for (var i in [...negativeNum, ...negativeDouble, ...negativeInt]) {
          var result = validateIsNotNegative(
            i,
          );
          expect(
            result,
            false,
          );
        }
      },
    );
  });
}
