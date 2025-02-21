import 'package:flutter/material.dart';
import 'package:two_be/Features/categories/presentation/widget/custom_header_and_icon.dart';
import 'package:two_be/core/utils/app_sizes.dart';
import 'package:two_be/core/widgets/custom_search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        children: [
          CustomHeaderAndIcon(title: "بحث"),
          height(30),
          CustomSearchBar(controller: TextEditingController())
        ],
      ),
    ));
  }
}
