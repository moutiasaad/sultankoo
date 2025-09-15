// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientDto _$ClientDtoFromJson(Map<String, dynamic> json) => ClientDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  phoneNumber: json['phone_number'] as String?,
  profileImage: json['profile_image'] as String?,
  currency: json['currency'] as String?,
  role: (json['role'] as num?)?.toInt(),
);

Map<String, dynamic> _$ClientDtoToJson(ClientDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'phone_number': instance.phoneNumber,
  'profile_image': instance.profileImage,
  'currency': instance.currency,
  'role': instance.role,
};
