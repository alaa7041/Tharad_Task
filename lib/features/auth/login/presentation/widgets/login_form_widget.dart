import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/shared_widgets/input_field.dart';
import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/shared_widgets/app_button.dart';
import '../../../../../core/theaming/fonts_helper.dart';
import '../../logic/cubit/login_cubit.dart';
import 'login_reminder_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          children: [
            InputField(
              labelText: "البريد الإلكتروني",
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return 'ادخل بريد صحيح';
                }
              },
              controller: context.read<LoginCubit>().emailController,
            ),
            InputField(
              labelText: "كلمة المرور",
              isPassword: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "ادخل كلمة مرور صحيحه";
                }
              },
              controller: context.read<LoginCubit>().passwordController,
            ),
          ],
        ));
  }
}
