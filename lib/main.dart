import 'package:flutter/material.dart';
import 'package:nlwt/modules/splash/splash_page.dart';
import 'package:nlwt/shared/themes/app_colors.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Payflow",
      theme: ThemeData(primaryColor: AppColors.primary),
      home: const SplashPage(),
    );
  }
}
