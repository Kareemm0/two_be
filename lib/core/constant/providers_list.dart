import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_be/Features/products/presentation/cubit/products_cubit.dart';
import 'package:two_be/di.dart';

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
      ],
      child: child,
    );
  }
}
