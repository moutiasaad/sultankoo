import 'package:json_annotation/json_annotation.dart';

part 'update_profile_request_body.g.dart';

@JsonSerializable()
class UpdateProfileRequestBody {
  @JsonKey(name: 'full_name')
  final String fullName;
  final String email;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  UpdateProfileRequestBody({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
  });

  factory UpdateProfileRequestBody.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileRequestBodyToJson(this);
}
