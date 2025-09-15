import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/product.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto {
  final int? id;
  final String? name;
  final double? weight;
  @JsonKey(name: 'weight_unit')
  final String? weightUnit;
  final double? price;
  @JsonKey(name: 'discounted_price')
  final String? discountedPrice;
  final String? sku;
  final int? quantity;
  final String? description;
  @JsonKey(name: 'product_type')
  final String? productType;
  @JsonKey(name: 'primary_image')
  final String? primaryImage;

  ProductDto({
    this.id,
    this.name,
    this.weight,
    this.weightUnit,
    this.price,
    this.discountedPrice,
    this.sku,
    this.quantity,
    this.description,
    this.productType,
    this.primaryImage,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);

  Product toProduct() {
    return Product(
      id: id,
      name: name,
      weight: weight,
      weightUnit: weightUnit,
      price: price,
      discountedPrice: discountedPrice,
      sku: sku,
      quantity: quantity,
      description: description,
      productType: productType,
      primaryImage: primaryImage,
    );
  }
}
