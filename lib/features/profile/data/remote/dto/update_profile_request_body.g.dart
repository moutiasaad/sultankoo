// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequestBody _$UpdateProfileRequestBodyFromJson(
  Map<String, dynamic> json,
) => UpdateProfileRequestBody(
  fullName: json['full_name'] as String,
  email: json['email'] as String,
  phoneNumber: json['phone_number'] as String,
);

Map<String, dynamic> _$UpdateProfileRequestBodyToJson(
  UpdateProfileRequestBody instance,
) => <String, dynamic>{
  'full_name': instance.fullName,
  'email': instance.email,
  'phone_number': instance.phoneNumber,
};
