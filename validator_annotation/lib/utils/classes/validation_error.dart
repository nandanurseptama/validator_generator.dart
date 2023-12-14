class ValidationError implements Exception {
  final String fieldName;
  final dynamic originalValue;
  final String errorMessage;

  ValidationError({
    required this.fieldName,
    required this.originalValue,
    required this.errorMessage,
  });
}
