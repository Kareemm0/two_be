import 'package:flutter/material.dart';
import 'package:two_be/di.dart';
import 'package:two_be/two_be_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjection();

  runApp(const TwoBeApp());
}
