import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_prac_1_eu/core/base/base_view_model.dart';
import 'package:flutter_mvvm_prac_1_eu/domain/entities/product/product_details.dart';
import 'package:flutter_mvvm_prac_1_eu/domain/usecases/product/get_product_details_usecase.dart';

/**
 * Created by Abdullah on 8/4/25.
 */

class ProductDetailsViewModel extends BaseViewModel{

  final GetProductDetailsUseCase _getProductDetailsUseCase;

  ProductDetailsViewModel(this._getProductDetailsUseCase);

  final ValueNotifier<ProductDetails?> product = ValueNotifier<ProductDetails?>(null);

  // Network Call
  void requestForProductDetailsList(int id){
    final productList = _getProductDetailsUseCase.execute(id);
    callService(productList,onSuccess: (response){
      product.value = response;
    });
  }


}