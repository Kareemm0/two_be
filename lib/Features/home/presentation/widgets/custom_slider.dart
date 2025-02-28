import 'package:flutter/material.dart';
import 'package:two_be/Features/home/data/models/banners_model/banners_model.dart';

import 'custom_dotted_slider.dart';
import 'custom_image_container.dart';

class CustomSlider extends StatefulWidget {
  final List<BannersModel> banners;
  final Function(int) onPageChanged;
  final int currentPage;
  const CustomSlider({
    super.key,
    required this.banners,
    required this.onPageChanged,
    required this.currentPage,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            onPageChanged: widget.onPageChanged,
            controller: _pageController,
            itemCount: widget.banners.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomImageContainer(
                  image: widget.banners[index].thumbnailUrl ?? "",
                ),
              );
            },
          ),
        ),
        CustomDottedSlider(
          currentPage: widget.currentPage,
          imageLength: widget.banners.length,
        ),
      ],
    );
  }
}
