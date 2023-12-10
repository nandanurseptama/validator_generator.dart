import 'package:analyzer/dart/constant/value.dart';
import 'package:validator_annotation/validator_annotation.dart';

/// Represents values from [ValidatorOptions] when merged with local
/// configuration.
///
/// Values are all known, so types are non-nullable.
///
class ValidatorOptionsConfig {
  final bool stopWhenFirstError;

  const ValidatorOptionsConfig({
    required this.stopWhenFirstError,
  });

  // NEED TO Change when ValidatorOptions updated 
  static const defaults = ValidatorOptionsConfig(
    stopWhenFirstError: false,
  );

  // NEED TO Change when ValidatorOptions updated 
  factory ValidatorOptionsConfig.fromDartObject(
    DartObject dartObject,
  ) =>
      ValidatorOptionsConfig(
        stopWhenFirstError:
            dartObject.getField('stopWhenFirstError')?.toBoolValue() ??
                ValidatorOptionsConfig.defaults.stopWhenFirstError,
      );
  ValidatorOptions get toValidatorOptions => ValidatorOptions(
        stopWhenFirstError: stopWhenFirstError,
      );

  // NEED TO Change when ValidatorOptions updated 
  String get toDartString =>
      '''const ValidatorOptions(stopWhenFirstError:$stopWhenFirstError)''';
}
