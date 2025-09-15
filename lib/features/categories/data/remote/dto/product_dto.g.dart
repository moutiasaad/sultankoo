// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  weight: (json['weight'] as num?)?.toDouble(),
  weightUnit: json['weight_unit'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  discountedPrice: json['discounted_price'] as String?,
  sku: json['sku'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  description: json['description'] as String?,
  productType: json['product_type'] as String?,
  primaryImage: json['primary_image'] as String?,
);

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'weight_unit': instance.weightUnit,
      'price': instance.price,
      'discounted_price': instance.discountedPrice,
      'sku': instance.sku,
      'quantity': instance.quantity,
      'description': instance.description,
      'product_type': instance.productType,
      'primary_image': instance.primaryImage,
    };
