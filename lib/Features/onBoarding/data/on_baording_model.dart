import 'package:two_be/core/utils/app_images.dart';

class OnBaordingModel {
  final String image;
  final String title;
  final String description;

  OnBaordingModel(
    this.image,
    this.title,
    this.description,
  );
}

List<OnBaordingModel> onBoarding = [
  OnBaordingModel(
    AppImages.onbarding1,
    'اكتشف منتجاتنا',
    'تصفح آلاف المنتجات، من الموضة إلى التكنولوجيا. ابحث عن ما تحبه دون عناء.',
  ),
  OnBaordingModel(
    AppImages.onbarding2,
    'الخروج خالية من المتاعب',
    'المدفوعات السلسة والتسليم السريع. ابدأ التسوق بشكل أكثر ذكاءً اليوم.',
  ),
  OnBaordingModel(
    AppImages.onbarding3,
    'تسوق سهل وسعيد',
    'ابدأ بالتسوق الآن واستمتع بعالم من الراحة!"',
  ),
];
