// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartDto _$CartDtoFromJson(Map<String, dynamic> json) => CartDto(
  id: (json['id'] as num?)?.toInt(),
  productId: (json['productId'] as num?)?.toInt(),
  cartKey: json['cartKey'] as String?,
  siteSub: json['siteSub'] as String?,
  qty: (json['qty'] as num?)?.toInt(),
  userId: (json['userId'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  product:
      json['product'] == null
          ? null
          : ProductDto.fromJson(json['product'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CartDtoToJson(CartDto instance) => <String, dynamic>{
  'id': instance.id,
  'productId': instance.productId,
  'cartKey': instance.cartKey,
  'siteSub': instance.siteSub,
  'qty': instance.qty,
  'userId': instance.userId,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'product': instance.product,
};
