import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/user_profile.dart';

part 'user_profile_dto.g.dart';

@JsonSerializable()
class UserProfileResponse {
  final UserProfileDto profile;

  UserProfileResponse({required this.profile});

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileResponseToJson(this);
}

@JsonSerializable()
class UserProfileDto {
  final int? id;
  final String? name;
  final String? email;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;

  UserProfileDto({
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.phoneNumber,
  });

  factory UserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileDtoToJson(this);

  UserProfile toUserProfile() {
    return UserProfile(
      id: id,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
    );
  }
}
