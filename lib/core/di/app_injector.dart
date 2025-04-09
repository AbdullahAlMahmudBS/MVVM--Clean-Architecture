import 'package:flutter_mvvm_prac_1_eu/core/di/injection.dart';
import 'package:flutter_mvvm_prac_1_eu/domain/usecases/product/get_product_details_usecase.dart';
import 'package:flutter_mvvm_prac_1_eu/presentation/screens/products/product_details/view_model/product_details_view_model.dart';
import 'package:get_it/get_it.dart';
import '../../data/datasources/product/product_remote_datasource.dart';
import '../../data/datasources/product/product_remote_datasource_impl.dart';
import '../../data/repositories/product/product_repository_impl.dart';
import '../../domain/repositories/product/product_repository.dart';
import '../../domain/usecases/product/get_products_usecase.dart';
import '../../presentation/screens/products/products_list/products_viewmodel.dart';

/**
 * Created by Abdullah on 8/4/25.
 */

final sl = GetIt.instance;

class AppInjector {
  static void configure() {
    Injector.resolve = sl;
    _registerSingletons();
    _registerFactories();
  }

  static void _registerSingletons() {


    // Register ProductRemoteDataSource
    sl.registerLazySingleton<ProductRemoteDataSource>(
          () => ProductRemoteDataSourceImpl(),
    );

    // Register ProductRepository (depends on ProductRemoteDataSource)
    sl.registerLazySingleton<ProductRepository>(
          () => ProductRepositoryImpl(
        sl(), // ProductRemoteDataSource
      ),
    );

    // Register GetProductsUseCase (depends on ProductRepository)
    sl.registerLazySingleton<GetProductsUseCase>(
          () => GetProductsUseCase(sl()),
    );

    sl.registerLazySingleton<GetProductDetailsUseCase>(
          () => GetProductDetailsUseCase(sl()),
    );


  }

  static void _registerFactories() {
    // Register ProductViewModel (depends on GetProductsUseCase)
    sl.registerFactory<ProductViewModel>(
          () => ProductViewModel(sl()),
    );
    sl.registerFactory<ProductDetailsViewModel>(
          () => ProductDetailsViewModel(sl()),
    );



  }
}