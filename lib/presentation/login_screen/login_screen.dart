import 'package:flutter/material.dart';
import 'package:team_app/presentation/home_screen/home_screen.dart';
import 'package:team_app/utility/constants/app_colors.dart';
import 'package:team_app/utility/constants/app_images.dart';
import 'package:team_app/utility/widgets/button_widget.dart';
import 'package:team_app/utility/widgets/sizedbox_widget.dart';
import 'package:team_app/utility/widgets/text_widget.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLightColor,
      body: Column(
        children: [
          SizedBoxWidget(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(
              child: Image.asset(
                AppImages.loginImg,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 15,
                    blurRadius: 30,
                    offset: const Offset(0, -6),
                  ),
                ],
              ),
              child: _loginWidgetFields(context)),
        ],
      ),
    );
  }

  _loginWidgetFields(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          child: Align(
            alignment: Alignment.center,
            child: TextWidget(
              text: 'Login',
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const TextWidget(
          text: "Email",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.semiDarkColor,
        ),
        TextField(
          controller:emailController ,
          decoration: const InputDecoration(
            hintText: "Your email ID",
            hintStyle: TextStyle(
                fontFamily: 'Poppins', fontSize: 12, color: AppColors.textGrey),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.greyColor),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const TextWidget(
          text: "Password",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.semiDarkColor,
        ),
        TextField(
          controller:passwordController,
          
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.remove_red_eye),
                        hintText: "Your Password",
            hintStyle: TextStyle(
                fontFamily: 'Poppins', fontSize: 12, color: AppColors.textGrey),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.greyColor),
            ),
          ),
        ),
        const SizedBoxWidget(
          height: 50,
        ),
        Align(
          alignment: Alignment.center,
          child: ButtonWidget(
              textColor: AppColors.lightColor,
              isDark: true,
              onClick: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
              backgroundColor: AppColors.darkColor,
              borderRadius: 40,
              height: 44,
              
              // width: 303,
              text: "Login"),
        )
      ]),
    );
  }
}
