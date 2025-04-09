import 'package:flutter_mvvm_prac_1_eu/domain/entities/product/product.dart';
import 'package:flutter_mvvm_prac_1_eu/domain/entities/product/product_details.dart';

/**
 * Created by Abdullah on 8/4/25.
 */

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<ProductDetails> getProductDetails(int id);
}