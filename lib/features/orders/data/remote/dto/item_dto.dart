import 'package:json_annotation/json_annotation.dart';

import '../../../../categories/data/remote/dto/product_dto.dart';
import '../../../domain/model/item.dart';

part 'item_dto.g.dart';

@JsonSerializable()
class ItemDto {
  final int? id;
  @JsonKey(name: 'product_id')
  final int? productId;
  @JsonKey(name: 'order_id')
  final int? orderId;
  final int? qty;
  @JsonKey(name: 'total_price')
  final double? totalePrice;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final ProductDto? product;

  ItemDto({
    this.id,
    this.productId,
    this.orderId,
    this.qty,
    this.totalePrice,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  factory ItemDto.fromJson(Map<String, dynamic> json) =>
      _$ItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDtoToJson(this);

  Item toItem() {
    return Item(
      id: id,
      productId: productId,
      orderId: orderId,
      qty: qty,
      totalePrice: totalePrice,
      createdAt: createdAt,
      updatedAt: updatedAt,
      product: product?.toProduct(),
    );
  }
}
