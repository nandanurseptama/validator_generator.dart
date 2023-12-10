import 'package:analyzer/dart/constant/value.dart';
import 'package:validator_annotation/validator_annotation.dart';

import 'validator_options_config.dart';

/// Represents values from [ClassValidator] when merged with local
/// configuration.
///
/// Values are all known, so types are non-nullable.
class ClassValidatorConfig {
  final ValidatorOptionsConfig validatorOptions;

  const ClassValidatorConfig({
    required this.validatorOptions,
  });

  // NEED To update when ClassValidator changed
  static const defaults = ClassValidatorConfig(
    validatorOptions: ValidatorOptionsConfig.defaults,
  );

  factory ClassValidatorConfig.fromDartObject(DartObject dartObject) {
    final validatorOptionsObject = dartObject.getField('validatorOptions');
    return ClassValidatorConfig(
      validatorOptions: validatorOptionsObject == null
          ? ValidatorOptionsConfig.defaults
          : ValidatorOptionsConfig.fromDartObject(
              validatorOptionsObject,
            ),
    );
  }
}
