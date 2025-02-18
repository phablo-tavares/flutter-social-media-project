import 'package:json_annotation/json_annotation.dart';

part 'phone_dto.g.dart';

@JsonSerializable()
class PhoneDto {
  PhoneDto({
    this.ddd,
    this.phoneNumber,
  });

  factory PhoneDto.fromJson(Map<String, dynamic> json) => _$PhoneDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneDtoToJson(this);

  String? ddd;
  String? phoneNumber;
}
