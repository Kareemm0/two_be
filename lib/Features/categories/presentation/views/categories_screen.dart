import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/core/extension/extension.dart';
import 'package:two_be/core/routes/routes.dart';
import '../../../home/data/models/category_model/category_model/category_model.dart';
import '../widget/custom_category_grid_view_item.dart';
import '../widget/custom_header_and_icon.dart';

class CategoriesScreen extends StatelessWidget {
  final List<CategoryModel> category;
  const CategoriesScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          children: [
            CustomHeaderAndIcon(
              title: "الاقسام",
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 24,
                ),
                itemBuilder: (context, index) {
                  return CustomCategoryGridViewItem(
                    image: category[index].image!.src ?? "",
                    title: category[index].name ?? "",
                  ).onTap(() {
                    context.push(Routes.product, extra: category[index].name);
                  });
                },
                itemCount: category.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
