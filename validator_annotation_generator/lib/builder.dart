// ignore_for_file: strict_raw_type

import 'dart:async';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'src/validator_model_generator.dart';

Builder validatorMetadataGenerator(BuilderOptions options) => PartBuilder(
      [
        ValidatorModelGenerator(),
      ],
      '.validator.dart',
    );

// Borrowed from `package:source_gen`
Iterable<String> _normalizeGeneratorOutput(Object? value) {
  if (value == null) {
    return const [];
  } else if (value is String) {
    value = [value];
  }

  if (value is Iterable) {
    return value.where((e) => e != null).map((e) {
      if (e is String) {
        return e.trim();
      }

      throw _argError(e as Object);
    }).where((e) => e.isNotEmpty);
  }
  throw _argError(value);
}

// Borrowed from `package:source_gen`
ArgumentError _argError(Object value) => ArgumentError(
    'Must be a String or be an Iterable containing String values. '
    'Found `${Error.safeToString(value)}` (${value.runtimeType}).');
