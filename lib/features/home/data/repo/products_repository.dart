import 'package:sultankoo/features/categories/domain/model/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> getByCategory(int categoryId);
}