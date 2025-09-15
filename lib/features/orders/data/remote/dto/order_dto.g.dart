// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersResponseDto _$OrdersResponseDtoFromJson(Map<String, dynamic> json) =>
    OrdersResponseDto(
      orders:
          json['orders'] == null
              ? null
              : OrdersDto.fromJson(json['orders'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrdersResponseDtoToJson(OrdersResponseDto instance) =>
    <String, dynamic>{'orders': instance.orders};

OrdersDto _$OrdersDtoFromJson(Map<String, dynamic> json) => OrdersDto(
  data:
      (json['data'] as List<dynamic>)
          .map((e) => OrderDto.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$OrdersDtoToJson(OrdersDto instance) => <String, dynamic>{
  'data': instance.data,
};

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => OrderDto(
  id: (json['id'] as num?)?.toInt(),
  orderNumber: json['order_number'] as String?,
  status: (json['status'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  totalPrice: (json['total_price'] as num?)?.toDouble(),
  formattedDate: json['formatted_date'] as String?,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => ItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$OrderDtoToJson(OrderDto instance) => <String, dynamic>{
  'id': instance.id,
  'order_number': instance.orderNumber,
  'status': instance.status,
  'currency': instance.currency,
  'total_price': instance.totalPrice,
  'formatted_date': instance.formattedDate,
  'items': instance.items,
};
