import 'client.dart';

class OrderDetails {
  final String? orderNumber;
  final int? isPaid;
  final PaymentMethod? paymentMethod;
  final String? trackingNumber;
  final int? status;
  final String? currency;
  final double? discountAmount;
  final double? totalPrice;
  final String? addressDetail;
  final String? createdAt;
  final Client? client;
  final List<OrderItem>? items;

  OrderDetails({
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
}

class PaymentMethod {
  final String? name;

  PaymentMethod({this.name});
}

class OrderItem {
  final int? qty;
  final double? totalePrice;
  final ProductDetails? product;

  OrderItem({this.qty, this.totalePrice, this.product});
}

class Code {
  final String? code;

  Code({this.code});
}

class ProductDetails {
  final String? name;
  final String? primaryImage;
  final double? price;
  final List<DirectCode>? directCodes;

  ProductDetails({this.name, this.primaryImage, this.price, this.directCodes});
}

class DirectCode {
  final int? id;
  final int? productId;
  final String? code;
  final int? sold;
  final int? orderId;
  final String? createdAt;
  final String? updatedAt;
  final String? provider;

  DirectCode({
    this.id,
    this.productId,
    this.code,
    this.sold,
    this.orderId,
    this.createdAt,
    this.updatedAt,
    this.provider,
  });
}
