// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => CategoryDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  catId: (json['cat_id'] as num?)?.toInt(),
  img: json['img'] as String?,
  type: (json['type'] as num?)?.toInt(),
  siteSub: json['site_sub'] as String?,
  description: json['description'] as String?,
  icon: json['icon'] as String?,
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  updatedAt:
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$CategoryDtoToJson(CategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cat_id': instance.catId,
      'img': instance.img,
      'type': instance.type,
      'site_sub': instance.siteSub,
      'description': instance.description,
      'icon': instance.icon,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
