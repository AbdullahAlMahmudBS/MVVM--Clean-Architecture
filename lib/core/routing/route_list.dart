import 'package:flutter_mvvm_prac_1_eu/core/routing/route_path.dart';
import 'package:flutter_mvvm_prac_1_eu/presentation/screens/products/product_details/product_details_screen.dart';
import 'package:flutter_mvvm_prac_1_eu/presentation/screens/products/products_list/products_list_screen.dart';
import 'package:flutter_mvvm_prac_1_eu/presentation/screens/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

/**
 * Created by Abdullah on 8/4/25.
 */

abstract class AppRoutesList {
  static allRoutes(){
    return [
      GoRoute(
          path: RoutePath.start,
          name: RoutePath.start,
          builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
          path: RoutePath.dashboard,
          name: RoutePath.dashboard,
          builder: (context, state) => ProductsScreen(),
      ),

      GoRoute(
          path: RoutePath.productDetails,
          name: RoutePath.productDetails,
          builder: (context, state) => ProductDetailsScreen(
            state.extra as int,
          ),
      ),








    ];
  }
}