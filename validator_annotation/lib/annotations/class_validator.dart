import 'package:equatable/equatable.dart';
import 'package:meta/meta_meta.dart';
import 'package:validator_annotation/utils/classes/validator_options.dart';

@Target({
  TargetKind.classType,
})
class ClassValidator extends Equatable {
  final ValidatorOptions validatorOptions;

  const ClassValidator({
    this.validatorOptions = const ValidatorOptions(),
  });

  Map<String, dynamic> get toJson {
    return {
      'validatorOptions': validatorOptions.toJson,
    };
  }

  @override
  String toString() {
    return 'ClassValidator(validatorOptions : $validatorOptions)';
  }

  @override
  List<Object?> get props => [
        validatorOptions,
      ];
}
