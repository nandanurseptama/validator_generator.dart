import 'package:analyzer/dart/constant/value.dart';
import 'package:validator_annotation/validator_annotation.dart';

/// Represents values from [ClassValidator] when merged with local
/// configuration.
///
/// Values are all known, so types are non-nullable.
class ClassValidatorConfig {
  final bool stopWhenFirstError;
  final NamingConvention namingConvention;

  const ClassValidatorConfig({
    required this.stopWhenFirstError,
    required this.namingConvention,
  });

  // NEED To update when ClassValidator changed
  static const defaults = ClassValidatorConfig(
    stopWhenFirstError: true,
    namingConvention: NamingConvention.camelCase,
  );

  factory ClassValidatorConfig.fromDartObject(DartObject dartObject) {
    final stopWhenFirstError =
        dartObject.getField('stopWhenFirstError')?.toBoolValue() ?? true;
    final namingConvention = NamingConvention.fromLabel(
      dartObject
              .getField('namingConvention')
              ?.getField('label')
              ?.toStringValue() ??
          NamingConvention.camelCase.label,
    );
    return ClassValidatorConfig(
      stopWhenFirstError: stopWhenFirstError,
      namingConvention: namingConvention,
    );
  }
}
