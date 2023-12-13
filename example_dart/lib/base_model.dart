import 'package:validator_annotation/validator_annotation.dart';

abstract class BaseModel {
  @IsPositiveNumberValidator()
  final int id;

  const BaseModel({
    required this.id,
  });
}
