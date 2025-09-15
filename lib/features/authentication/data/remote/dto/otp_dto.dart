import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/otp.dart';

part 'otp_dto.g.dart';

@JsonSerializable()
class OtpDto {
  const OtpDto({required this.otpKey});

  @JsonKey(name: 'otp_key')
  final String otpKey;

  factory OtpDto.fromJson(Map<String, dynamic> json) => _$OtpDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OtpDtoToJson(this);

  Otp toOtp() => Otp(otpKey: otpKey);
}
