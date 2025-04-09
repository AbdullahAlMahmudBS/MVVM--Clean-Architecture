import 'package:flutter_mvvm_prac_1_eu/core/network/exceptions/app_exception.dart';
import 'package:flutter_mvvm_prac_1_eu/domain/entities/product/product_details.dart';
import '../../../domain/entities/product/product.dart';
import '../../../domain/repositories/product/product_repository.dart';
import '../../datasources/product/product_remote_datasource.dart';

/**
 * Created by Abdullah on 8/4/25.
 */

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(
      this.remoteDataSource,
      );

  @override
  Future<List<Product>> getProducts() async {
    final products = await remoteDataSource.getProducts();
    return products.map((product) => product.toDomain()).toList();
  }

  @override
  Future<ProductDetails> getProductDetails(int id) async{
    final productDetails = await  remoteDataSource.getProductDetails(id);
    return productDetails.toDomain();
  }
}