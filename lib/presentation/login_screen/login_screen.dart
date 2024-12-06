import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_app/bloc/auth/login_cubit.dart';
import 'package:team_app/bloc/auth/login_state.dart';
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
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("login creds are invalid")),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is LoginLoading;

          return Column(
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
                child: _loginWidgetFields(context, isLoading),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _loginWidgetFields(BuildContext context, bool isLoading) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            controller: emailController,
            decoration: const InputDecoration(
              hintText: "Your email ID",
              hintStyle: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: AppColors.textGrey,
              ),
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
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.remove_red_eye),
              hintText: "Your Password",
              hintStyle: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: AppColors.textGrey,
              ),
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
              isInProgress: isLoading,
              onClick:() {
                      final loginCubit = context.read<LoginCubit>();
                      final email = emailController.text;
                      final password = passwordController.text;

                      if (email.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill in all fields."),
                          ),
                        );
                      } else {
                        loginCubit.login(email, password);
                      }
                    },
              backgroundColor: AppColors.darkColor,
              borderRadius: 40,
              height: 44,
              text: "Login",
            ),
          ),
        ],
      ),
    );
  }
}
