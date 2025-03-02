import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tharad_tech/core/helpers/app_regex.dart';
import 'package:tharad_tech/core/shared_widgets/input_field.dart';
import '../../logic/cubit/register_cubit.dart';
import 'profile_image.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({
    super.key,
  });

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<RegisterCubit>().formKey,
        child: Column(
          children: [
            ProfileImageContainer(
              onTap: () => context.read<RegisterCubit>().selectImage(),
              imageFile: context.watch<RegisterCubit>().selectedImage,
            ),
            InputField(
              labelText: "الاسم",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'ادخل الاسم';
                }
              },
              controller: context.read<RegisterCubit>().nameController,
            ),
            InputField(
              labelText: "البريد الإلكتروني",
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return 'ادخل البريد الإلكتروني';
                }
              },
              controller: context.read<RegisterCubit>().emailController,
            ),
            InputField(
              labelText: "كلمة المرور",
              isPassword: true,
              controller: context.read<RegisterCubit>().passwordController,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    AppRegex.isPasswordValid(value)) {
                  return 'ادخل كلمة المرور صحيحه';
                }
              },
            ),
            InputField(
              labelText: "كلمة المرور",
              isPassword: true,
              controller:
                  context.read<RegisterCubit>().passwordConfirmationController,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    AppRegex.isPasswordValid(value)) {
                  return 'ادخل كلمة المرور صحيحه';
                }
              },
            ),
          ],
        ));
  }
}
