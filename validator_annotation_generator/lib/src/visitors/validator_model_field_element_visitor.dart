import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:source_gen/source_gen.dart';
import 'package:validator_annotation/validator_annotation.dart';

import '../utils/function_generator.dart';

class ValidatorModelFieldElementVisitor extends SimpleElementVisitor<void> {
  final Map<String, List<String>> fieldsWithAnnotations = {};

  @override
  void visitFieldElement(FieldElement element) {
    final fieldName = element.name;
    final annotationSources = List<String>.empty(
      growable: true,
    );
    for (final metadata in element.metadata) {
      final metadataElement = metadata.element;
      if (metadataElement == null) {
        continue;
      }
      final enclosingElement = metadataElement.enclosingElement;
      if (enclosingElement == null) {
        continue;
      }
      if (!const TypeChecker.fromRuntime(ValidatorAnnotation).isSuperOf(
        enclosingElement,
      )) {
        continue;
      }
      annotationSources.add(
        metadata.toSource().replaceFirst('@', ''),
      );
    }

    if (annotationSources.isEmpty) {
      return;
    }
    fieldsWithAnnotations.addAll(
      {
        fieldName: annotationSources,
      },
    );
  }

  String? generateAllFieldsValidatorFunction() {
    if (fieldsWithAnnotations.isEmpty) {
      return null;
    }
    final sources = fieldsWithAnnotations.entries
        .map(
          (e) => createStaticFunctionValidatorFromFieldNameAndMetadatas(
            fieldName: e.key,
            validatorAnnotations: e.value,
          ),
        )
        .toList()
        .join('\n');
    return sources;
  }
}
