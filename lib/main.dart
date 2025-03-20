import 'package:flutter/material.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';
import 'package:tabby_flutter_inapp_sdk/tabby_flutter_inapp_sdk.dart';
import 'package:two_be/core/constant/constant.dart';
import 'package:two_be/di.dart';
import 'package:two_be/two_be_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjection();
  TabbySDK().setup(
    withApiKey: "pk_0191455f-f587-2129-25dd-671533150817",
  );
  await MFSDK.init(
    ftoorhApiKey,
    MFCountry.SAUDIARABIA,
    MFEnvironment.LIVE,
  );

  runApp(const TwoBeApp());
}
