// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDto _$ItemDtoFromJson(Map<String, dynamic> json) => ItemDto(
  id: (json['id'] as num?)?.toInt(),
  productId: (json['product_id'] as num?)?.toInt(),
  orderId: (json['order_id'] as num?)?.toInt(),
  qty: (json['qty'] as num?)?.toInt(),
  totalePrice: (json['total_price'] as num?)?.toDouble(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  product:
      json['product'] == null
          ? null
          : ProductDto.fromJson(json['product'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItemDtoToJson(ItemDto instance) => <String, dynamic>{
  'id': instance.id,
  'product_id': instance.productId,
  'order_id': instance.orderId,
  'qty': instance.qty,
  'total_price': instance.totalePrice,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'product': instance.product,
};
