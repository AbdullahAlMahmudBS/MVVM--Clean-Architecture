
import 'package:flutter_mvvm_prac_1_eu/domain/entities/product/product.dart';
import 'package:flutter_mvvm_prac_1_eu/domain/entities/product/product_details.dart';
import 'package:flutter_mvvm_prac_1_eu/domain/repositories/product/product_repository.dart';

/**
 * Created by Abdullah on 8/4/25.
 */

class GetProductDetailsUseCase {
  final ProductRepository productRepository;

  GetProductDetailsUseCase(this.productRepository);

  Future<ProductDetails> execute(int id) async {
    return  productRepository.getProductDetails(id);
  }

}