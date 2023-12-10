import 'package:equatable/equatable.dart';

/// Create Validation Options
class ValidatorOptions extends Equatable {
  /// when [stopWhenFirstError] is true, validation will stop when first error occur
  final bool stopWhenFirstError;

  const ValidatorOptions({
    this.stopWhenFirstError = false,
  });

  factory ValidatorOptions.fromJson(Map<String, dynamic> json) =>
      ValidatorOptions(
        stopWhenFirstError: json['stopWhenFirstError'] as bool? ?? false,
      );

  Map<String, dynamic> get toJson => {
        'stopWhenFirstError': stopWhenFirstError,
      };

  @override
  List<Object?> get props => [
        stopWhenFirstError,
      ];
}
