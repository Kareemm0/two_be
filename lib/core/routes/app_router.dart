import 'package:go_router/go_router.dart';
import 'package:two_be/Features/Auth/presentation/view/login_screen.dart';
import 'package:two_be/Features/Auth/presentation/view/register_screen.dart';
import 'package:two_be/Features/bottom_nav_bar/presentation/view/bottom_nav_bar_screen.dart';
import 'package:two_be/Features/cart/presentation/views/order_summary_screen.dart';
import 'package:two_be/Features/categories/presentation/views/categories_screen.dart';
import 'package:two_be/Features/home/data/models/category_model/category_model/category_model.dart';
import 'package:two_be/Features/notifications/presentation/views/notification_screen.dart';
import 'package:two_be/Features/onBoarding/presentation/views/on_boarding_screen.dart';
import 'package:two_be/Features/products/presentation/views/products_details_screen.dart';
import 'package:two_be/Features/products/presentation/views/products_screen.dart';
import 'package:two_be/core/routes/routes.dart';
import '../../Features/Auth/presentation/view/forget_password_screen.dart';
import '../../Features/splash/presentation/view/splash_screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: Routes.splash,
    builder: (ctx, state) => SplashScreen(),
  ),
  GoRoute(
    path: Routes.login,
    builder: (ctx, state) => LoginScreen(),
  ),
  GoRoute(
    path: Routes.onBoarding,
    builder: (ctx, state) => OnboardingScreen(),
  ),
  GoRoute(
    path: Routes.register,
    builder: (ctx, state) => RegisterScreen(),
  ),
  GoRoute(
    path: Routes.bottomNavigationBar,
    builder: (ctx, state) => BottomNavBarScreen(),
  ),
  GoRoute(
    path: Routes.category,
    builder: (ctx, state) {
      final category = state.extra;
      return CategoriesScreen(category: category as List<CategoryModel>);
    },
  ),
  GoRoute(
    path: Routes.product,
    builder: (ctx, state) {
      final categoryName = state.extra;
      return ProductsScreen(categoryName: categoryName as String);
    },
  ),
  GoRoute(
    path: Routes.productDetails,
    builder: (ctx, state) {
      final id = state.extra;
      return ProductsDetailsScreen(id: int.parse(id.toString()));
    },
  ),
  GoRoute(
    path: Routes.orderSummary,
    builder: (ctx, state) => OrderSummaryScreen(),
  ),
  GoRoute(
    path: Routes.forgetPasswordScreen,
    builder: (ctx, state) => ForgetPasswordScreen(),
  ),
  GoRoute(
    path: Routes.notificationScreen,
    builder: (ctx, state) => NotificationScreen(),
  )
]);
