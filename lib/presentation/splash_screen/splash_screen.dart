import 'package:flutter/material.dart';
import 'package:team_app/presentation/login_screen/login_screen.dart';
import 'package:team_app/utility/constants/app_colors.dart';
import 'package:team_app/utility/constants/app_images.dart';
import 'package:team_app/utility/widgets/button_widget.dart';
import 'package:team_app/utility/widgets/sizedbox_widget.dart';
import 'package:team_app/utility/widgets/text_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBoxWidget(
              width: MediaQuery.of(context).size.height,
              child: Image.asset(
                AppImages.splashImg,
                fit: BoxFit.cover,
              )),
              const SizedBoxWidget(
                height:15,
              ),
           const Align(
            alignment: Alignment.center,
            child: TextWidget(
              text: "Manage your projects,",
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
           const Align(
            alignment: Alignment.center,
            child: TextWidget(
              text: "Task, Clients",
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBoxWidget(height: 35,),
          ButtonWidget(
            textColor: AppColors.lightColor,
            onClick: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
          },
          backgroundColor: AppColors.darkColor,
          borderRadius: 40,
          height: 44,
          width: 303,
           text: "Get Started")
        ],
      ),
    );
  }
}
