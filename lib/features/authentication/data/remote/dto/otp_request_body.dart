import 'package:json_annotation/json_annotation.dart';

part 'otp_request_body.g.dart';

@JsonSerializable()
class OtpRequestBody {
  final String email;
  @JsonKey(name: 'otp_code')
  final String otpCode;
  @JsonKey(name: 'otp_key')
  final String otpKey;

  const OtpRequestBody({
    required this.email,
    required this.otpCode,
    required this.otpKey,
  });

  factory OtpRequestBody.fromJson(Map<String, dynamic> json) =>
      _$OtpRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$OtpRequestBodyToJson(this);
}
