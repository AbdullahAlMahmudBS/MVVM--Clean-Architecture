import 'package:flutter_mvvm_prac_1_eu/data/models/product/product_details_model.dart';
import 'package:flutter_mvvm_prac_1_eu/data/models/product/product_model.dart';

/**
 * Created by Abdullah on 8/4/25.
 */

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<ProductDetailsModel> getProductDetails(int id);
}
