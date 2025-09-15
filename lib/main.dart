import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/utils/constants.dart';
import 'core/utils/extensions.dart';
import 'core/utils/shared_pref_helper.dart';
import 'sultankoo_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Perform necessary setups
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();

  // Run the app
  runApp(SultankooApp(router: router));
}

checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  isLoggedInUser = !userToken.isNullOrEmpty();
}
