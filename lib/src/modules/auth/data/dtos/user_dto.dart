import 'package:json_annotation/json_annotation.dart';
import 'package:rede_social_flutter/src/modules/auth/data/dtos/phone_dto.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  UserDto({
    this.id,
    this.email,
    this.name,
    this.phone,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  //TODO ver como fazer com que o firestore ignore este campo id ao salvar um novo usuário
  String? id;
  String? email;
  String? name;
  PhoneDto? phone;
}
