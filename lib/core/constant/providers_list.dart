import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_be/Features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:two_be/Features/cart/presentation/cubit/cart_cubit.dart';
import 'package:two_be/Features/products/presentation/cubit/products_cubit.dart';
import 'package:two_be/di.dart';

import '../../Features/home/presentation/cubit/home_cubit.dart';

class AppRootProvider extends StatelessWidget {
  final Widget child;

  const AppRootProvider({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                ProductsCubit(getIt())..getProducts(category: "")),
        BlocProvider(create: (context) => HomeCubit(getIt())),
        BlocProvider(create: (context) => ProductsCubit(getIt())),
        BlocProvider(create: (context) => CartCubit(getIt())..getCart()),
        BlocProvider(create: (context) => AuthCubit(getIt())..getCountries()),
      ],
      child: child,
    );
  }
}
