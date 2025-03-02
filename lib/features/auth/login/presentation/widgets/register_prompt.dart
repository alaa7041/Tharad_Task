import 'package:flutter/material.dart';
import 'package:tharad_tech/core/theaming/fonts_helper.dart';

class RegistrationPrompt extends StatelessWidget {
  final VoidCallback onSignUp;
  bool isRegister;

  RegistrationPrompt(
      {super.key, this.isRegister = false, required this.onSignUp});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isRegister! ? 'لديك حساب؟ ' : 'ليس لديك حساب؟ ',
          style: FontsHelper.font14Black600,
        ),
        GestureDetector(
          onTap: onSignUp,
          child: Text(
            isRegister! ? 'تسجيل دخول' : 'إنشاء حساب جديد',
            style: FontsHelper.font14DarkGreen400,
          ),
        ),
      ],
    );
  }
}
