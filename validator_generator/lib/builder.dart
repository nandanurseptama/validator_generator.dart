// ignore_for_file: strict_raw_type

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'src/validator_model_generator.dart';

Builder validatorBuilder(BuilderOptions options) => PartBuilder(
      [
        ValidatorModelGenerator(),
      ],
      '.validator.dart',
    );
