/// Provides a generator to generate class validator
/// that annotate with [ClassValidator]
///
/// also it will generate each field validator function (static function)
/// that annotate with [ValidatorAnnotation]
library validator_generator;

import 'package:validator_annotation/validator_annotation.dart';

export 'builder.dart';
