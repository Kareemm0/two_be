import 'package:flutter/material.dart';
import '../widget/custom_category_grid_view_item.dart';
import '../widget/custom_header_and_icon.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

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
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return CustomCategoryGridViewItem();
                },
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
