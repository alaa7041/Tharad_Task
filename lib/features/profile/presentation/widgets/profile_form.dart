import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/shared_widgets/app_button.dart';
import 'package:tharad_tech/core/shared_widgets/input_field.dart';
import 'package:tharad_tech/features/profile/cubit/update_profile_cubit.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/theaming/fonts_helper.dart';
import '../../../auth/register/presentation/widgets/profile_image.dart';
import 'update_bloc_listener.dart';

class ProfileForm extends StatelessWidget {
  final String username;
  final String email;

  const ProfileForm({
    super.key,
    required this.username,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    context.read<UpdateProfileCubit>().nameController.text = username;
    context.read<UpdateProfileCubit>().emailController.text = email;
    return Form(
        key: context.read<UpdateProfileCubit>().formKey,
        child: Column(
          children: [
            InputField(
              labelText: "الاسم",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid name';
                }
              },
              controller: context.read<UpdateProfileCubit>().nameController,
            ),
            InputField(
              labelText: "البريد الإلكتروني",
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return 'ادخل بريد الكتروني صحيح';
                }
              },
              controller: context.read<UpdateProfileCubit>().emailController,
            ),
            ProfileImageContainer(
              onTap: () => context.read<UpdateProfileCubit>().selectImage(),
              imageFile: context.watch<UpdateProfileCubit>().selectedImage,
            ),
            InputField(
              labelText: "كلمة المرور القديمة",
              isPassword: true,
              controller: context.read<UpdateProfileCubit>().passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'ادخل كلمة المرور القديمة';
                }
              },
            ),
            InputField(
              labelText: "كلمة المرور الجديدة",
              isPassword: true,
              controller: context.read<UpdateProfileCubit>().newPassword,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isPasswordValid(value)) {
                  return 'ادخل كلمة مرور جديدة صحيحة';
                }
              },
            ),
            InputField(
              labelText: "تأكيد كلمة المرور الجديدة",
              isPassword: true,
              controller:
                  context.read<UpdateProfileCubit>().newPasswordConfirmation,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value !=
                        context.read<UpdateProfileCubit>().newPassword.text) {
                  return 'يجب أن تتطابق كلمات المرور الجديدة';
                }
              },
            ),
            AppButton(
              text: "حفظ التغييرات",
              textStyle: FontsHelper.font14LighterGreen400,
              height: 50.h,
              radius: 7.r,
              onPerssed: () {
                validateThenDoSignup(context);
              },
            ),
            UpdateProfileBlocListener(),
          ],
        ));
  }
}

void validateThenDoSignup(BuildContext context) {
  if (context.read<UpdateProfileCubit>().formKey.currentState!.validate()) {
    context.read<UpdateProfileCubit>().emitUpdateProfiileStates(context);
  }
}
