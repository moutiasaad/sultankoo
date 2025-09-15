import 'package:json_annotation/json_annotation.dart';

part 'login_request_body.g.dart';

@JsonSerializable()
class LogInRequestBody {
  final String email;

  const LogInRequestBody({required this.email});

  factory LogInRequestBody.fromJson(Map<String, dynamic> json) =>
      _$LogInRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LogInRequestBodyToJson(this);
}
