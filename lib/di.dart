import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_be/Features/Auth/Data/repo/auth_repo_impl.dart';
import 'package:two_be/Features/Auth/Data/source/base/auth_source.dart';
import 'package:two_be/Features/Auth/Data/source/impl/auth_source_impl.dart';
import 'package:two_be/Features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:two_be/Features/home/data/repo/home_repo_impl.dart';
import 'package:two_be/Features/home/data/source/impl/home_source_impl.dart';
import 'package:two_be/Features/home/domin/repo/home_repo.dart';
import 'package:two_be/Features/home/presentation/cubit/home_cubit.dart';
import 'package:two_be/core/network/dio/dio_client.dart';
import 'Features/Auth/domian/repo/auth_repo.dart';
import 'Features/home/data/source/base/home_source.dart';
import 'core/constant/end_points.dart';
import 'core/network/dio/base_dio.dart';
import 'core/network/dio/dio_interceptor.dart';

GetIt getIt = GetIt.instance;
SharedPreferences preferences = getIt<SharedPreferences>();
Future<void> initDependencyInjection() async {
  await _registerSingletons();
  _registerDataSources();
  _registerRepos();
  _registerFactory();
}

Future<void> _registerSingletons() async {
  getIt.registerLazySingleton<GlobalKey<NavigatorState>>(
    () => GlobalKey<NavigatorState>(),
  );
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  BaseOptions options = BaseOptions(
    validateStatus: (status) {
      // if (status == null) {
      //   return false;
      // }
      // if (status == 422 || status == 302) {
      //   return true;
      // } else {
      //   return status >= 200 && status < 300;
      // }
      return status != null && status < 500;
    },
    baseUrl: EndPoints.baseurl,
    followRedirects: false,
    headers: {
      'Content-Type': 'application/json',
    },
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );
  getIt.registerSingleton<BaseDio>(
      DioClient(options: options, dio: Dio(), interceptors: [
    DioInterceptor(),
  ]));
  getIt.registerSingleton<SharedPreferences>(preferences);
}

void _registerDataSources() {
  getIt.registerSingleton<AuthSource>(AuthSourceImpl(getIt()));
  getIt.registerSingleton<HomeSource>(HomeSourceImpl(getIt()));
}

void _registerRepos() {
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(getIt()));
  getIt.registerSingleton<HomeRepo>(HomeRepoImpl(getIt()));
}

void _registerFactory() {
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
