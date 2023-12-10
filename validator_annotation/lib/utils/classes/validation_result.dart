import 'package:equatable/equatable.dart';
import 'package:validator_annotation/utils/classes/validation_data.dart';
import 'package:validator_annotation/utils/classes/validation_error.dart';
import 'package:validator_annotation/utils/classes/validator_options.dart';

/// A holder class to hold validation result
///
/// [errors] is list of error in [MapEntry] type
///
/// key of [MapEntry] is fieldName
///
/// value of [MapEntry] is errorMessage
class ValidationResult extends Equatable implements Exception {
  /// list of error in [MapEntry]
  ///
  /// key of [MapEntry] is fieldName
  ///
  /// value of [MapEntry] is errorMessage
  final List<ValidationError> errors;

  final List<ValidationData> validationData;

  final ValidatorOptions validatorOptions;

  /// will true when errors is not empty
  bool get isError => errors.isNotEmpty;

  /// get first error
  ///
  /// key of map entry is field
  ///
  /// if there any error occured, will throw [Exception]
  String get firstErrorToString {
    if (!isError) {
      throw Exception("There is no error");
    }
    return "${firstError.fieldName} : ${firstError.errorMessage}";
  }

  /// get first error in [String]
  ///
  /// if there any error occured, will throw [Exception]
  ValidationError get firstError {
    if (!isError) {
      throw Exception("There is no error");
    }
    return errors.first;
  }

  /// guard function
  T when<T>({
    required T Function(ValidationResult result) error,
    required T Function(ValidationResult result) noError,
  }) {
    if (isError) {
      return error(this);
    }
    return noError(
      this,
    );
  }

  const ValidationResult({
    required this.errors,
    required this.validatorOptions,
    required this.validationData,
  }) : super();

  @override
  List<Object?> get props => [
        errors,
        validationData,
        validatorOptions,
      ];
}
