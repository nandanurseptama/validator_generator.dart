import 'package:test/test.dart';
import 'package:validator_annotation/annotations/numeric_annotations/is_zero_validator.dart';

import '../metadata_test_helper.dart';

void main() {
  group("IsZeroValidator", () {
    testValidatorMetadataFieldName(
      IsZeroValidator(
        fieldName: "zeroField",
      ),
      "zeroField",
    );

    testValidatorMetadataErrorMessage(
      IsZeroValidator(
        errorMessage: "must be zero",
      ),
      "must be zero",
    );

    testValidatorMetadataSuccessValidate(
      instance: IsZeroValidator(),
      expectedValidateResultValue: true,
      valueToValidate: 0,
      description:
          "When value is zero, should be success validate and return true",
    );

    testValidatorMetadataSuccessValidate(
      instance: IsZeroValidator(
        errorMessage: "must be zero",
      ),
      expectedValidateResultValue: false,
      valueToValidate: -1,
      description:
          "When value is negative, should be success validate and return false",
      expectedErrorMessage: "must be zero",
    );

    testValidatorMetadataSuccessValidate(
      instance: IsZeroValidator(
        errorMessage: "must be zero",
      ),
      expectedValidateResultValue: false,
      valueToValidate: 1,
      description:
          "When value is positive, should be success validate and return false",
      expectedErrorMessage: "must be zero",
    );

    testValidatorMetadataFailedValidate(
      instance: IsZeroValidator(),
      description: "When value is null, should be throw exception",
      valueToValidate: null,
    );

    testValidatorMetadataFailedValidate(
      instance: IsZeroValidator(),
      description: "When value is not numeric, should be throw exception",
      valueToValidate: "42",
    );
  });
}
