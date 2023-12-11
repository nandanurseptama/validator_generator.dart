import 'package:meta/meta_meta.dart';

/// Create [ValidatorAnnotation]
///
/// annotation class to validate an instance or property in a class
///
/// implements this class to create new decorator

@Target({
  TargetKind.field,
})
abstract class ValidatorAnnotation {
  /// decorator name
  final String name;

  /// field name
  ///
  /// when [fieldName] value null, it will take property name
  final String? fieldName;

  /// when [errorMessage] value is null,
  /// it will take error message from [defaultErrorMessage]
  final String? _errorMessage;

  const ValidatorAnnotation({
    required this.name,
    this.fieldName,
    String? errorMessage,
  }) : _errorMessage = errorMessage;

  /// implement this function to validate [value]
  ///
  /// [value] is the value of instance or member of property where decorator placed
  ///
  /// should return true if value is valid
  bool validate(dynamic value);

  /// default error message when [errorMessage] value is null
  String get defaultErrorMessage;

  /// get error message
  String get errorMessage => _errorMessage ?? defaultErrorMessage;
}
