import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:validator_annotation/validator_annotation.dart';

import 'configs/class_validator_config.dart';
import 'utils/function_generator.dart';
import 'visitors/validator_model_field_element_visitor.dart';

class ValidatorModelGenerator extends GeneratorForAnnotation<ClassValidator> {
  @override
  String? generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        '`@ClassValidator` can only be used on classes.',
        element: element,
      );
    }

    final elementName = element.name;

    final validatorModelElementVisitor = ValidatorModelFieldElementVisitor();
    final classValidatorConfig = ClassValidatorConfig.fromDartObject(
      annotation.objectValue,
    );

    element.visitChildren(
      validatorModelElementVisitor,
    );
    final fieldsWithAnnotations =
        validatorModelElementVisitor.fieldsWithAnnotations;
    if (fieldsWithAnnotations.isEmpty) {
      return null;
    }
    final fieldsValidationSource =
        validatorModelElementVisitor.generateAllFieldsValidatorFunction();

    if (fieldsValidationSource == null) {
      return null;
    }
    final validatorInstanceSources = createStaticFunctionValidatorFromInstance(
      modelName: elementName,
      fields: fieldsWithAnnotations,
      config: classValidatorConfig,
    );
    return '''
      class ${elementName}Validator{
        $fieldsValidationSource
        $validatorInstanceSources
      }
    ''';
  }
}
