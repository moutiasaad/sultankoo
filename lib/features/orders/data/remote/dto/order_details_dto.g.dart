// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponseDto _$OrderResponseDtoFromJson(Map<String, dynamic> json) =>
    OrderResponseDto(
      order: OrderDetailsDto.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderResponseDtoToJson(OrderResponseDto instance) =>
    <String, dynamic>{'order': instance.order};

OrderDetailsDto _$OrderDetailsDtoFromJson(Map<String, dynamic> json) =>
    OrderDetailsDto(
      orderNumber: json['orderNumber'] as String?,
      isPaid: (json['is_paid'] as num?)?.toInt(),
      paymentMethod:
          json['payment_method'] == null
              ? null
              : PaymentMethodDto.fromJson(
                json['payment_method'] as Map<String, dynamic>,
              ),
      trackingNumber: json['tracking_number'] as String?,
      status: (json['status'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      discountAmount: (json['discount_amount'] as num?)?.toDouble(),
      totalPrice: (json['total_price'] as num?)?.toDouble(),
      addressDetail: json['addressDetail'] as String?,
      createdAt: json['created_at'] as String?,
      client:
          json['client'] == null
              ? null
              : ClientDto.fromJson(json['client'] as Map<String, dynamic>),
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => OrderItemDto.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$OrderDetailsDtoToJson(OrderDetailsDto instance) =>
    <String, dynamic>{
      'orderNumber': instance.orderNumber,
      'is_paid': instance.isPaid,
      'payment_method': instance.paymentMethod,
      'tracking_number': instance.trackingNumber,
      'status': instance.status,
      'currency': instance.currency,
      'discount_amount': instance.discountAmount,
      'total_price': instance.totalPrice,
      'addressDetail': instance.addressDetail,
      'created_at': instance.createdAt,
      'client': instance.client,
      'items': instance.items,
    };

PaymentMethodDto _$PaymentMethodDtoFromJson(Map<String, dynamic> json) =>
    PaymentMethodDto(name: json['name'] as String?);

Map<String, dynamic> _$PaymentMethodDtoToJson(PaymentMethodDto instance) =>
    <String, dynamic>{'name': instance.name};

OrderItemDto _$OrderItemDtoFromJson(Map<String, dynamic> json) => OrderItemDto(
  qty: (json['qty'] as num?)?.toInt(),
  totalePrice: (json['totalePrice'] as num?)?.toDouble(),
  codes:
      (json['codes'] as List<dynamic>?)
          ?.map((e) => CodeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
  product:
      json['product'] == null
          ? null
          : ProductDetailsDto.fromJson(json['product'] as Map<String, dynamic>),
  directCodes:
      (json['directCodes'] as List<dynamic>?)
          ?.map((e) => DirectCodeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$OrderItemDtoToJson(OrderItemDto instance) =>
    <String, dynamic>{
      'qty': instance.qty,
      'totalePrice': instance.totalePrice,
      'codes': instance.codes,
      'product': instance.product,
      'directCodes': instance.directCodes,
    };

CodeDto _$CodeDtoFromJson(Map<String, dynamic> json) =>
    CodeDto(code: json['code'] as String?);

Map<String, dynamic> _$CodeDtoToJson(CodeDto instance) => <String, dynamic>{
  'code': instance.code,
};

ProductDetailsDto _$ProductDetailsDtoFromJson(Map<String, dynamic> json) =>
    ProductDetailsDto(
      name: json['name'] as String?,
      primaryImage: json['primary_image'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      directCodes:
          (json['direct_codes'] as List<dynamic>?)
              ?.map((e) => DirectCodeDto.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ProductDetailsDtoToJson(ProductDetailsDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'primary_image': instance.primaryImage,
      'price': instance.price,
      'direct_codes': instance.directCodes,
    };

DirectCodeDto _$DirectCodeDtoFromJson(Map<String, dynamic> json) =>
    DirectCodeDto(
      id: (json['id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      code: json['code'] as String?,
      sold: (json['sold'] as num?)?.toInt(),
      orderId: (json['order_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      provider: json['provider'] as String?,
    );

Map<String, dynamic> _$DirectCodeDtoToJson(DirectCodeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'code': instance.code,
      'sold': instance.sold,
      'order_id': instance.orderId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'provider': instance.provider,
    };
