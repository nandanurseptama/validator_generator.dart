import 'package:analyzer/dart/constant/value.dart';
import 'package:validator_annotation/validator_annotation.dart';

/// Represents values from [ClassValidator] when merged with local
/// configuration.
///
/// Values are all known, so types are non-nullable.
class ClassValidatorConfig {
  final bool stopWhenFirstError;

  const ClassValidatorConfig({
    required this.stopWhenFirstError,
  });

  // NEED To update when ClassValidator changed
  static const defaults = ClassValidatorConfig(
    stopWhenFirstError: true,
  );

  factory ClassValidatorConfig.fromDartObject(DartObject dartObject) {
    final stopWhenFirstError =
        dartObject.getField('stopWhenFirstError')?.toBoolValue() ?? true;
    return ClassValidatorConfig(
      stopWhenFirstError: stopWhenFirstError,
    );
  }
}
