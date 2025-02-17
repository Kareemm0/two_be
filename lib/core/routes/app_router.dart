import 'package:go_router/go_router.dart';
import 'package:two_be/core/routes/routes.dart';

import '../../Features/splash/presentation/view/splash_screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: Routes.splash,
    builder: (ctx, state) => SplashScreen(),
  )
]);
