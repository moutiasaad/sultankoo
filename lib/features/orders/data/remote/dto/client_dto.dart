import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/client.dart';

part 'client_dto.g.dart';

@JsonSerializable()
class ClientDto {
  final int? id;
  final String? name;
  final String? email;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  final String? currency;
  final int? role;

  ClientDto({
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.phoneNumber,
    this.profileImage,
    this.currency,
    this.role,
  });

  factory ClientDto.fromJson(Map<String, dynamic> json) =>
      _$ClientDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ClientDtoToJson(this);

  Client toClient() {
    return Client(
      id: id,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      profileImage: profileImage,
      currency: currency,
      role: role,
    );
  }
}
