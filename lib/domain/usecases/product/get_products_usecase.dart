
import 'package:flutter_mvvm_prac_1_eu/domain/entities/product/product.dart';
import 'package:flutter_mvvm_prac_1_eu/domain/repositories/product/product_repository.dart';

/**
 * Created by Abdullah on 8/4/25.
 */

class GetProductsUseCase {
  final ProductRepository productRepository;

  GetProductsUseCase(this.productRepository);

  Future<List<Product>> execute() async {
    return productRepository.getProducts();
  }
}