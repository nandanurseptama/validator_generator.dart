import '../utils.dart';

/// A holder class to hold validation result
///
/// [errors] is list of error in [MapEntry] type
///
/// key of [MapEntry] is fieldName
///
/// value of [MapEntry] is errorMessage
class ValidationResult implements Exception {
  /// list of error in [MapEntry]
  ///
  /// key of [MapEntry] is fieldName
  ///
  /// value of [MapEntry] is errorMessage
  final List<ValidationError> errors;

  final List<ValidationData> validationData;

  /// will true when errors is not empty
  bool get isError => errors.isNotEmpty;

  /// get first error
  ///
  /// key of map entry is field
  ///
  /// if there any error occured, will throw [Exception]
  String get firstErrorToString {
    if (!isError) {
      throw Exception('There is no error');
    }
    return '${firstError.fieldName} : ${firstError.errorMessage}';
  }

  /// get first error in [String]
  ///
  /// if there any error occured, will throw [Exception]
  ValidationError get firstError {
    if (!isError) {
      throw Exception('There is no error');
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
    required this.validationData,
  }) : super();
}
