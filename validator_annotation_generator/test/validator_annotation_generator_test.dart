@TestOn('vm')
library test;

import 'package:path/path.dart' as p;
import 'package:source_gen_test/source_gen_test.dart';
import 'package:test/test.dart';
import 'package:validator_annotation_generator/src/validator_model_generator.dart';


void main() async {
  final validatorAnnotationGeneratorReader =
      await initializeLibraryReaderForDirectory(
    p.join(
      'test',
      'src',
    ),
    'test_input.dart',
  );
  initializeBuildLogTracking();

  testAnnotatedElements(
    validatorAnnotationGeneratorReader,
    ValidatorModelGenerator(),
    expectedAnnotatedTests: _expectedAnnotatedTests,
  );
}

const _expectedAnnotatedTests = {
  'UserModel',
  'UserModelWithSnackCaseNamingConvention',
  'ProfileModel',
  'topLevelVariabel',
};
