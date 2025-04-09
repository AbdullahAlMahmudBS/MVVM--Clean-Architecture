import 'package:flutter_mvvm_prac_1_eu/core/base/base_remote_source.dart';
import 'package:flutter_mvvm_prac_1_eu/data/api/api_endpoints.dart';
import 'package:flutter_mvvm_prac_1_eu/data/datasources/product/product_remote_datasource.dart';
import 'package:flutter_mvvm_prac_1_eu/data/models/product/product_details_model.dart';
import 'package:flutter_mvvm_prac_1_eu/data/models/product/product_model.dart';

/**
 * Created by Abdullah on 8/4/25.
 */

class ProductRemoteDataSourceImpl extends BaseRemoteSource implements ProductRemoteDataSource {

  final String BASE_URL = ApiEndPoints.baseUrl;

  ProductRemoteDataSourceImpl();

  @override
  Future<List<ProductModel>> getProducts() async {
    var endpoint = '$BASE_URL/${ApiEndPoints.products}';

    final dioCall = dioClient.get(
      endpoint,
    );

    try {
      return callApiWithErrorParser(dioCall).then((response) {
        final List<dynamic> data = response.data;
        return data.map((item) => ProductModel.fromJson(item)).toList();
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductDetailsModel> getProductDetails(int id) {
    var endpoint = '$BASE_URL/${ApiEndPoints.products}/$id';
    final dioCall = dioClient.get(
      endpoint,
    );

    try {
      return callApiWithErrorParser(dioCall).then((response) {
        return ProductDetailsModel.fromJson(response.data);
      });
    } catch (e) {
      rethrow;
    }

  }
}