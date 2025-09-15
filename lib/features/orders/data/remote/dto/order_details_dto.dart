import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/order_details.dart';
import 'client_dto.dart';

part 'order_details_dto.g.dart';

@JsonSerializable()
class OrderResponseDto {
  final OrderDetailsDto order;

  OrderResponseDto({required this.order});

  factory OrderResponseDto.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseDtoToJson(this);
}

@JsonSerializable()
class OrderDetailsDto {
  final String? orderNumber;
  @JsonKey(name: 'is_paid')
  final int? isPaid;
  @JsonKey(name: 'payment_method')
  final PaymentMethodDto? paymentMethod;
  @JsonKey(name: 'tracking_number')
  final String? trackingNumber;
  final int? status;
  final String? currency;
  @JsonKey(name: 'discount_amount')
  final double? discountAmount;
  @JsonKey(name: 'total_price')
  final double? totalPrice;
  final String? addressDetail;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  final ClientDto? client;
  final List<OrderItemDto>? items;

  OrderDetailsDto({
    this.orderNumber,
    this.isPaid,
    this.paymentMethod,
    this.trackingNumber,
    this.status,
    this.currency,
    this.discountAmount,
    this.totalPrice,
    this.addressDetail,
    this.createdAt,
    this.client,
    this.items,
  });

  factory OrderDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsDtoToJson(this);

  OrderDetails toOrderDetails() {
    return OrderDetails(
      orderNumber: orderNumber,
      isPaid: isPaid,
      paymentMethod: paymentMethod?.toPaymentMethod(),
      trackingNumber: trackingNumber,
      status: status,
      currency: currency,
      discountAmount: discountAmount,
      totalPrice: totalPrice,
      addressDetail: addressDetail,
      createdAt: createdAt,
      client: client?.toClient(),
      items: items?.map((e) => e.toOrderItem()).toList(),
    );
  }
}

@JsonSerializable()
class PaymentMethodDto {
  final String? name;

  PaymentMethodDto({this.name});

  factory PaymentMethodDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodDtoToJson(this);

  PaymentMethod toPaymentMethod() {
    return PaymentMethod(name: name);
  }
}

@JsonSerializable()
class OrderItemDto {
  final int? qty;
  final double? totalePrice;
  final List<CodeDto>? codes;
  final ProductDetailsDto? product;
  final List<DirectCodeDto>? directCodes;
  OrderItemDto({
    this.qty,
    this.totalePrice,
    this.codes,
    this.product,
    this.directCodes,
  });

  factory OrderItemDto.fromJson(Map<String, dynamic> json) =>
      _$OrderItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemDtoToJson(this);

  OrderItem toOrderItem() {
    return OrderItem(
      qty: qty,
      totalePrice: totalePrice,
      product: product?.toProductDetails(),
    );
  }
}

@JsonSerializable()
class CodeDto {
  final String? code;

  CodeDto({this.code});

  factory CodeDto.fromJson(Map<String, dynamic> json) =>
      _$CodeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CodeDtoToJson(this);

  Code toCode() {
    return Code(code: code);
  }
}

@JsonSerializable()
class ProductDetailsDto {
  final String? name;
  @JsonKey(name: 'primary_image')
  final String? primaryImage;
  final double? price;
  @JsonKey(name: 'direct_codes')
  final List<DirectCodeDto>? directCodes;

  ProductDetailsDto({
    this.name,
    this.primaryImage,
    this.price,
    this.directCodes,
  });

  factory ProductDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsDtoToJson(this);

  ProductDetails toProductDetails() {
    return ProductDetails(
      name: name,
      primaryImage: primaryImage,
      price: price,
      directCodes: directCodes?.map((e) => e.toDirectCode()).toList(),
    );
  }
}

@JsonSerializable()
class DirectCodeDto {
  final int? id;
  @JsonKey(name: 'product_id')
  final int? productId;
  final String? code;
  final int? sold;
  @JsonKey(name: 'order_id')
  final int? orderId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final String? provider;

  DirectCodeDto({
    this.id,
    this.productId,
    this.code,
    this.sold,
    this.orderId,
    this.createdAt,
    this.updatedAt,
    this.provider,
  });

  factory DirectCodeDto.fromJson(Map<String, dynamic> json) =>
      _$DirectCodeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DirectCodeDtoToJson(this);

  DirectCode toDirectCode() {
    return DirectCode(
      id: id,
      productId: productId,
      code: code,
      sold: sold,
      orderId: orderId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      provider: provider,
    );
  }
}
