// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDto _$HomeDtoFromJson(Map<String, dynamic> json) => HomeDto(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => HomeItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$HomeDtoToJson(HomeDto instance) => <String, dynamic>{
  'data': instance.data,
};

HomeItemDto _$HomeItemDtoFromJson(Map<String, dynamic> json) => HomeItemDto(
  id: (json['id'] as num?)?.toInt(),
  type: json['type'] as String?,
  ident: json['ident'] as String?,
  value: json['value'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  buttonText: json['button_text'] as String?,
  space: json['space'] as String?,
  size: json['size'] as String?,
  siteSub: json['site_sub'] as String?,
  animation: json['animation'] as String?,
  link: json['link'] as String?,
  itemGroup: json['item_group'] as String?,
  itemOrder: (json['item_order'] as num?)?.toInt(),
  themeId: (json['theme_id'] as num?)?.toInt(),
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  updatedAt:
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$HomeItemDtoToJson(HomeItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'ident': instance.ident,
      'value': instance.value,
      'title': instance.title,
      'description': instance.description,
      'button_text': instance.buttonText,
      'space': instance.space,
      'size': instance.size,
      'site_sub': instance.siteSub,
      'animation': instance.animation,
      'link': instance.link,
      'item_group': instance.itemGroup,
      'item_order': instance.itemOrder,
      'theme_id': instance.themeId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
