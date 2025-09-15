import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/category.dart';

part 'category_dto.g.dart';

@JsonSerializable()
class CategoryDto {
  final int? id;
  final String? name;
  @JsonKey(name: 'cat_id')
  final int? catId;
  final String? img;
  final int? type;
  @JsonKey(name: 'site_sub')
  final String? siteSub;
  final String? description;
  final String? icon;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  CategoryDto({
    this.id,
    this.name,
    this.catId,
    this.img,
    this.type,
    this.siteSub,
    this.description,
    this.icon,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);

  Category toCategory() {
    return Category(
      id: id,
      name: name,
      catId: catId,
      img: img,
      type: type,
      siteSub: siteSub,
      description: description,
      icon: icon,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
