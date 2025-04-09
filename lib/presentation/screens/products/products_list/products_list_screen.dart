import 'package:flutter/material.dart';
import 'package:flutter_mvvm_prac_1_eu/core/base/base_view.dart';
import 'package:flutter_mvvm_prac_1_eu/core/routing/app_routes.dart';
import 'package:flutter_mvvm_prac_1_eu/core/routing/route_path.dart';
import 'package:flutter_mvvm_prac_1_eu/core/utils/language_helper.dart';
import 'package:flutter_mvvm_prac_1_eu/core/widgets/language_swircher.dart';
import 'package:flutter_mvvm_prac_1_eu/domain/entities/product/product.dart';
import 'package:flutter_mvvm_prac_1_eu/generated/app_localizations.dart';
import 'package:flutter_mvvm_prac_1_eu/presentation/screens/products/products_list/products_viewmodel.dart';

import 'widgets/product_item_widget.dart';

/**
 * Created by Abdullah on 8/4/25.
 */

class ProductsScreen extends BaseView<ProductViewModel> {


  ProductsScreen({super.key}) {
    viewModel.requestForProductsList();
  }

  @override
  PreferredSizeWidget? appBar() {
    return AppBar(
      centerTitle: true,
      leading: const SizedBox(),
      title:
      Text(Localized.products),
      actions: const [
        LanguageSwitcher()
      ],

    );
  }
  @override
  Widget body(BuildContext context) {
    return ValueListenableBuilder<List<Product>>(
      valueListenable: viewModel.products,
      builder: (context, products, _) {
        return GridView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16, // vertical space between items
              crossAxisSpacing: 16, // horizontal space between items
              childAspectRatio: 0.78,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductItemWidget(
                product: product,
                onTap: () {
                  AppRoutes.pushNamed(RoutePath.productDetails,extra: product.id);
                },
              );
            },
          );

      },
    )
    ;
  }
}
