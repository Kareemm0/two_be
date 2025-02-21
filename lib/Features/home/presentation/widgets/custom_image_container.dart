import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  final String image;
  const CustomImageContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}
