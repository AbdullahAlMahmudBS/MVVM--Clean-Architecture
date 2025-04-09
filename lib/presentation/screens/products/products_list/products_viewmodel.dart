
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_prac_1_eu/core/base/base_view_model.dart';
import 'package:flutter_mvvm_prac_1_eu/domain/entities/product/product.dart';
import 'package:flutter_mvvm_prac_1_eu/domain/usecases/product/get_products_usecase.dart';

/**
 * Created by Abdullah on 8/4/25.
 */


class ProductViewModel extends BaseViewModel{
  final GetProductsUseCase _getProductsUseCase;

  ProductViewModel(this._getProductsUseCase);

  final ValueNotifier<List<Product>> products = ValueNotifier([]);

  // Network Call

  void requestForProductsList(){
    final productList = _getProductsUseCase.execute();
    callService(productList,onSuccess: (response){
      products.value = response;
    });
  }


}