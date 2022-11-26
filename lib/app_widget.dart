import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nlwt/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:nlwt/modules/home/home_page.dart';
import 'package:nlwt/modules/insert_bill/insert_bill_page.dart';
import 'package:nlwt/modules/splash/splash_page.dart';
import 'package:nlwt/shared/models/user_model.dart';

import 'modules/login/login_page.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key}) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Payflow",
      theme: ThemeData(
          primaryColor: AppColors.primary, primarySwatch: Colors.orange),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashPage(),
        "/home": (context) => HomePage(
            user: ModalRoute.of(context)!.settings.arguments as UserModel),
        "/login": (context) => const LoginPage(),
        "/barcode_scanner": (context) => const BarcodeScannerPage(),
        "/insert_bill": (context) => InsertBillPage(
              barcode: ModalRoute.of(context)!.settings.arguments as String,
            ),
      },
    );
  }
}
