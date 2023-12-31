import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

ElementAnnotation? getElementAnnotationFromElement({
  required Element classElement,
  required Type type,
}) {
  if (classElement.metadata.isEmpty) {
    return null;
  }
  for (final metadata in classElement.metadata) {
    final metadataElement = metadata.element;
    if (metadataElement == null) {
      continue;
    }

    final enclosingElement = metadataElement.enclosingElement;
    if (enclosingElement == null) {
      continue;
    }

    final isEnclosingElementClassValidatorType =
        TypeChecker.fromRuntime(type).isExactly(enclosingElement);
    if (!isEnclosingElementClassValidatorType) {
      continue;
    }
    return metadata;
  }
  return null;
}
