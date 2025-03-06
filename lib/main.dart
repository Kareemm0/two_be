import 'package:flutter/material.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';
import 'package:two_be/core/constant/constant.dart';
import 'package:two_be/di.dart';
import 'package:two_be/two_be_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjection();
  MFSDK.init(
    ftoorhApiKey,
    MFCountry.SAUDIARABIA,
    MFEnvironment.LIVE,
  );

  runApp(const TwoBeApp());
}
