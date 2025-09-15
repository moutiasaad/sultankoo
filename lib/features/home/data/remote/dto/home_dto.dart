import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/home.dart';

part 'home_dto.g.dart';

@JsonSerializable()
class HomeDto {
  final List<HomeItemDto>? data;

  HomeDto({this.data});

  factory HomeDto.fromJson(Map<String, dynamic> json) =>
      _$HomeDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HomeDtoToJson(this);
}

@JsonSerializable()
class HomeItemDto {
  final int? id;
  final String? type;
  final String? ident;
  final String? value;
  final String? title;
  final String? description;
  @JsonKey(name: 'button_text')
  final String? buttonText;
  final String? space;
  final String? size;
  @JsonKey(name: 'site_sub')
  final String? siteSub;
  final String? animation;
  final String? link;
  @JsonKey(name: 'item_group')
  final String? itemGroup;
  @JsonKey(name: 'item_order')
  final int? itemOrder;
  @JsonKey(name: 'theme_id')
  final int? themeId;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  HomeItemDto({
    this.id,
    this.type,
    this.ident,
    this.value,
    this.title,
    this.description,
    this.buttonText,
    this.space,
    this.size,
    this.siteSub,
    this.animation,
    this.link,
    this.itemGroup,
    this.itemOrder,
    this.themeId,
    this.createdAt,
    this.updatedAt,
  });

  factory HomeItemDto.fromJson(Map<String, dynamic> json) =>
      _$HomeItemDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HomeItemDtoToJson(this);

  Home toHome() => Home(
    id: id,
    type: type,
    ident: ident,
    value: value,
    title: title,
    description: description,
    buttonText: buttonText,
    space: space,
    size: size,
    siteSub: siteSub,
    animation: animation,
    link: link,
    itemGroup: itemGroup,
  );
}
