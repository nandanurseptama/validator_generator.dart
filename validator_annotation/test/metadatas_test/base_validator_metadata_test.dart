// ignore_for_file: unnecessary_type_check, no_leading_underscores_for_local_identifiers

import 'package:test/test.dart';
import 'package:validator_annotation/annotations/annotations.dart';

class _ValidatorMetadata extends ValidatorAnnotation {
  _ValidatorMetadata({
    super.fieldName,
    super.errorMessage,
  }) : super(
          name: "_ValidatorMetadata",
        );

  @override
  String get defaultErrorMessage => "defaultErrorMessage";

  @override
  bool validate(value) {
    return true;
  }
}

void main() {
  late _ValidatorMetadata _validatorMetadataToTest;
  final String expectedFieldName = "userName";
  final String expectedDefaultErrorMessage = "defaultErrorMessage";
  final String expectedErrorMessage = "its validator metadata";
  final String expectedValidatorName = "_ValidatorMetadata";

  setUpAll(() {
    _validatorMetadataToTest = _ValidatorMetadata(
      fieldName: expectedFieldName,
      errorMessage: expectedErrorMessage,
    );
  });

  group("ValidatorMetadata Test", () {
    test("_ValidatorMetadata should be instance of ValidatorMetadata", () {
      expect(
        _validatorMetadataToTest is ValidatorAnnotation,
        isTrue,
      );
    });

    test("_ValidatorMetadata should be have expected validatorName", () {
      expect(
        _validatorMetadataToTest.name,
        expectedValidatorName,
      );
    });

    test("_ValidatorMetadata should be have expected fieldName", () {
      expect(
        _validatorMetadataToTest.fieldName,
        expectedFieldName,
      );
    });

    test("_ValidatorMetadata should be have expected errorMessage", () {
      expect(
        _validatorMetadataToTest.errorMessage,
        expectedErrorMessage,
      );
    });

    test(
        "_ValidatorMetadata validate function should implements validate function",
        () {
      expect(
        () => _validatorMetadataToTest.validate(
          null,
        ),
        returnsNormally,
      );
    });

    test(
        "_ValidatorMetadata defaultErrorMessage should same with expectedDefaultErrorMessage ",
        () {
      expect(
        _validatorMetadataToTest.defaultErrorMessage,
        expectedDefaultErrorMessage,
      );
    });

    test(
        "when error message not supplied in _ValidatorMetadata, should return defaultErrorMessage",
        () {
      var _validatorMetadataWithoutErrorMessage = _ValidatorMetadata();
      expect(
        _validatorMetadataWithoutErrorMessage.errorMessage,
        expectedDefaultErrorMessage,
      );
    });

    test(
        "when error message not supplied in _ValidatorMetadata, should return defaultErrorMessage",
        () {
      var _validatorMetadataWithoutErrorMessage = _ValidatorMetadata();
      expect(
        _validatorMetadataWithoutErrorMessage.fieldName,
        isNull,
      );
    });

    test(
        "when 2 instances of validator metadata have difference properties, should not match",
        () {
      var _validatorMetadataWithoutErrorMessage = _ValidatorMetadata();
      expect(
        _validatorMetadataToTest == _validatorMetadataWithoutErrorMessage,
        isFalse,
      );
      expect(
        _validatorMetadataToTest.props ==
            _validatorMetadataWithoutErrorMessage.props,
        isFalse,
      );
    });
  });
}
