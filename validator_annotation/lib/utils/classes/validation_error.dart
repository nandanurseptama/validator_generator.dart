import 'package:equatable/equatable.dart';

class ValidationError extends Equatable {
  final String fieldName;
  final dynamic originalValue;
  final String errorMessage;

  ValidationError({
    required this.fieldName,
    required this.originalValue,
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [
        fieldName,
        originalValue,
        errorMessage,
      ];
}
