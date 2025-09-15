// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpRequestBody _$OtpRequestBodyFromJson(Map<String, dynamic> json) =>
    OtpRequestBody(
      email: json['email'] as String,
      otpCode: json['otp_code'] as String,
      otpKey: json['otp_key'] as String,
    );

Map<String, dynamic> _$OtpRequestBodyToJson(OtpRequestBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp_code': instance.otpCode,
      'otp_key': instance.otpKey,
    };
