import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/token.dart';

part 'token_dto.g.dart';

@JsonSerializable()
class TokenDto {
  const TokenDto({required this.token});

  final String token;

  factory TokenDto.fromJson(Map<String, dynamic> json) =>
      _$TokenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDtoToJson(this);

  Token toToken() => Token(token: token);
}
