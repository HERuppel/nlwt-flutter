import 'package:flutter/material.dart';
import 'package:nlwt/modules/login/login_controller.dart';
import 'package:nlwt/shared/themes/app_colors.dart';
import 'package:nlwt/shared/themes/app_images.dart';
import 'package:nlwt/shared/themes/app_text_style.dart';
import 'package:nlwt/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppColors.background,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Container(
                  width: size.width,
                  height: size.height * 0.36,
                  color: AppColors.primary),
              Positioned(
                  top: 40,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    AppImages.person,
                    width: 208,
                    height: 270,
                  )),
              Positioned(
                left: 0,
                right: 0,
                bottom: size.height * 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.logomini),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 70, left: 70, top: 20),
                      child: Text(
                        "Organize seus boletos em um só lugar",
                        style: TextStyles.titleHome,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 40),
                      child: SocialLoginButton(onTap: () {
                        controller.googleSignIn(context);
                      }),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
