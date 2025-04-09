import 'package:flutter/material.dart';
import 'package:flutter_mvvm_prac_1_eu/core/base/base_view.dart';
import 'package:flutter_mvvm_prac_1_eu/domain/entities/product/product_details.dart';
import 'package:flutter_mvvm_prac_1_eu/presentation/screens/products/product_details/view_model/product_details_view_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

/**
 * Created by Abdullah on 8/4/25.
 */

class ProductDetailsScreen extends BaseView<ProductDetailsViewModel> {
  int productId;

  ProductDetailsScreen(this.productId, {super.key}){
    viewModel.requestForProductDetailsList(productId);
  }

  @override
  Widget body(BuildContext context) {
    return  ValueListenableBuilder<ProductDetails?>(
        valueListenable: viewModel.product,
        builder: (context, products, _) {
      return CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: 'product-image-${viewModel.product.value?.id}',
                  child: Image.network(
                    viewModel.product.value?.imageUrl ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    // Add share functionality if desired
                  },
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      viewModel.product.value?.name ?? "",
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                    ),
                    const SizedBox(height: 8),
                    if(viewModel.product.value != null)
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: viewModel.product.value?.ratingRate ?? 0.0,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          unratedColor: Colors.grey[300],
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${viewModel.product.value?.ratingRate} (${viewModel.product.value?.ratingCount} reviews)',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "\$${(viewModel.product.value?.price ?? 0.0 ).toStringAsFixed(2)} ",
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Chip(
                      label: Text(viewModel.product.value?.category ?? ""),
                      backgroundColor: Colors.blue[50],
                      labelStyle: TextStyle(color: Colors.blue[800]),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      viewModel.product.value?.description ?? "",
                      style: TextStyle(color: Colors.grey[800], fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add_shopping_cart),
                      label: const Text('Add to Cart'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
        },
    );
  }
}
