import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/order.dart';
import 'item_dto.dart';

part 'order_dto.g.dart';

@JsonSerializable()
class OrdersResponseDto {
  final OrdersDto? orders;

  OrdersResponseDto({this.orders});

  factory OrdersResponseDto.fromJson(Map<String, dynamic> json) =>
      _$OrdersResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersResponseDtoToJson(this);
}

@JsonSerializable()
class OrdersDto {
  final List<OrderDto> data;

  OrdersDto({required this.data});

  factory OrdersDto.fromJson(Map<String, dynamic> json) =>
      _$OrdersDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersDtoToJson(this);
}

@JsonSerializable()
class OrderDto {
  final int? id;
  @JsonKey(name: 'order_number')
  final String? orderNumber;
  final int? status;
  final String? currency;
  @JsonKey(name: 'total_price')
  final double? totalPrice;
  @JsonKey(name: 'formatted_date')
  final String? formattedDate;
  final List<ItemDto>? items;

  OrderDto({
    this.id,
    this.orderNumber,
    this.status,
    this.currency,
    this.totalPrice,
    this.formattedDate,
    this.items,
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDtoToJson(this);

  Order toOrder() {
    return Order(
      id: id,
      orderNumber: orderNumber,
      status: status,
      currency: currency,
      totalPrice: totalPrice,
      formattedDate: formattedDate,
      items: items?.map((item) => item.toItem()).toList(),
    );
  }
}
