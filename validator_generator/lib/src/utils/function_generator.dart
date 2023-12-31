import 'package:validator_annotation/validator_annotation.dart';

import '../configs/class_validator_config.dart';
import '../helpers/string_helpers.dart';

/// [validatorAnnotations] lisf of string validator annotations
String createStaticFunctionValidatorFromFieldNameAndMetadatas({
  required String fieldName,
  required List<String> validatorAnnotations,
  required NamingConvention namingConvention,
}) {
  if (validatorAnnotations.isEmpty || fieldName.isEmpty) {
    return '';
  }
  final functionName = convertVariableNameToValidatorFunctionName(
    fieldName,
    namingConvention,
  );
  final annotationSources =
      validatorAnnotations.map((e) => 'const $e').join(',\n');
  final annotations = '''[\n$annotationSources];''';
  return '''
  static String? $functionName(dynamic value){
    final validatorAnnotations = $annotations
    return validateField(value, validatorAnnotations,);
  }
  ''';
}

/// [fields] is map of fieldName and lisf of string validator annotations
String createStaticFunctionValidatorFromInstance({
  required String modelName,
  required Map<String, List<String>> fields,
  required ClassValidatorConfig config,
}) {
  final validationDataSourcesString = fields.entries
      .map(
        (e) => createValidationDataSourceString(
          fieldName: e.key,
          validatorAnnotations: e.value,
        ),
      )
      .toList()
      .join(',\n');
  final validationDationDataString = '''[\n$validationDataSourcesString];''';
  return '''
  static ValidationResult validate($modelName instance){
    // validation data
    final validationDatas = $validationDationDataString
    
    // validator options
    const stopWhenFirstError = ${config.stopWhenFirstError};
    return validateInstance(validationDatas, stopWhenFirstError:stopWhenFirstError,);
  }
  ''';
}

/// [validatorAnnotations] lisf of string validator annotations
String createValidationDataSourceString({
  required String fieldName,
  required List<String> validatorAnnotations,
}) {
  final annotationSources =
      validatorAnnotations.map((e) => 'const $e').join(',\n');
  final annotations = '''[\n$annotationSources]''';
  final validationDataSource = '''
 ValidationData(
      instanceMemberSymbol : '$fieldName',
      valueToValidate : instance.$fieldName,
      annotations : $annotations,
    )''';
  return validationDataSource;
}
