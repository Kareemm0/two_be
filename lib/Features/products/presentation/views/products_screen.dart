import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/core/extension/extension.dart';
import 'package:two_be/core/routes/routes.dart';
import 'package:two_be/core/utils/app_sizes.dart';
import '../../../categories/presentation/widget/custom_header_and_icon.dart';
import '../widget/custom_product_item.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          children: [
            CustomHeaderAndIcon(title: "المنتجات"),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => CustomProductItem().onTap(() {
                  context.push(Routes.productDetails);
                }),
                separatorBuilder: (context, index) => height(16),
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
