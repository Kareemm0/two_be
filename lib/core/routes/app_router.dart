import 'package:go_router/go_router.dart';
import 'package:two_be/Features/Auth/presentation/view/login_screen.dart';
import 'package:two_be/Features/Auth/presentation/view/register_screen.dart';
import 'package:two_be/Features/bottom_nav_bar/presentation/view/bottom_nav_bar_screen.dart';
import 'package:two_be/Features/onBoarding/presentation/views/on_boarding_screen.dart';
import 'package:two_be/core/routes/routes.dart';
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
  )
]);
