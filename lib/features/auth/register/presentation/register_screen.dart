import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/helpers/extentions.dart';
import 'package:tharad_tech/core/routing/routs.dart';
import 'package:tharad_tech/core/theaming/fonts_helper.dart';
import '../../../../core/shared_widgets/app_button.dart';
import '../../login/presentation/widgets/register_prompt.dart';
import '../logic/cubit/register_cubit.dart';
import 'widgets/register_bloc_listener.dart';
import 'widgets/register_form_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 55.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
                height: 100.h,
                width: 200.w,
              ),
              Text("إنشاء حساب جديد", style: FontsHelper.font20Black600),
              RegisterFormWidget(),
              RegisterBlocListener(),
              AppButton(
                text: "إنشاء حساب جديد",
                textStyle: FontsHelper.font14LighterGreen400,
                height: 50.h,
                radius: 7.r,
                onPerssed: () {
                  validateThenDoSignup(context);
                },
              ),
              RegistrationPrompt(
                onSignUp: () {
                  context.pushReplacementNamed(Routes.loginScreen);
                },
                isRegister: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void validateThenDoSignup(BuildContext context) {
  if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
    context.read<RegisterCubit>().emitRegisterStates(context);
  }
}
