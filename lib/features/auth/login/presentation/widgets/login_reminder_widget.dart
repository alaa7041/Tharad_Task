import 'package:flutter/material.dart';
import 'package:tharad_tech/core/theaming/color_healper.dart';
import 'package:tharad_tech/core/theaming/fonts_helper.dart';

class LoginReminderWidget extends StatelessWidget {
  final bool rememberMe;
  final ValueChanged<bool?> onRememberMeChanged;
  final VoidCallback onForgotPassword;

  const LoginReminderWidget({
    Key? key,
    required this.rememberMe,
    required this.onRememberMeChanged,
    required this.onForgotPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberMe,
              onChanged: onRememberMeChanged,
              activeColor: ColorsHelper.darkGreen,
            ),
             Text(
              'تذكرني',
              style: FontsHelper.font16DarkGreen400,
            ),
          ],
        ),
        GestureDetector(
          onTap: onForgotPassword,
          child: Text(
            'هل نسيت كلمة المرور؟',
            style: FontsHelper.font16DarkGreen400,
          ),
        ),
      ],
    );
  }
}
