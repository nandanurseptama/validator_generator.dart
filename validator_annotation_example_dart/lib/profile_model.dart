import 'package:validator_annotation/validator_annotation.dart';
import 'package:validator_annotation_example_dart/base_model.dart';

part 'profile_model.validator.dart';

@ClassValidator()
class ProfileModel extends BaseModel {
  @IsNotEmptyStringValidator()
  @MaxStringLengthValidator(
    length: 64,
  )
  final String fullName;

  const ProfileModel({
    required super.id,
    required this.fullName,
  });
}
