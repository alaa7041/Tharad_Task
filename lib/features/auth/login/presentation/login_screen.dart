import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/helpers/spacing.dart';
import 'package:tharad_tech/core/routing/routs.dart';
import 'package:tharad_tech/core/theaming/fonts_helper.dart';
import '../../../../core/shared_widgets/app_button.dart';
import '../logic/cubit/login_cubit.dart';
import 'widgets/Login_bloc_listener.dart';
import 'widgets/login_form_widget.dart';
import 'widgets/register_prompt.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 100.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
                height: 100.h,
                width: 200.w,
              ),
              verticalSpace(60),
              Text("تسجيل الدخول", style: FontsHelper.font20Black600),
              LoginFormWidget(),
              RegistrationPrompt(
                isRegister: true,
                onSignUp: () {
                  Navigator.pushNamed(context, Routes.registerScreen);
                },
              ),
              AppButton(
                text: "تسجيل",
                textStyle: FontsHelper.font14LighterGreen400,
                height: 50.h,
                radius: 7.r,
                onPerssed: () {
                  validateThenDoLogin(context);
                },
              ),
              LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}

//فالديت من الكوبيت وبعدين لوجن
void validateThenDoLogin(BuildContext context) {
  if (context.read<LoginCubit>().formKey.currentState!.validate()) {
    context.read<LoginCubit>().emitLogin();
  }
}
