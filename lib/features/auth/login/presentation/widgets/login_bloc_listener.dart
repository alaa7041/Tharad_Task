import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/helpers/extentions.dart';
import 'package:tharad_tech/core/theaming/fonts_helper.dart';
import '../../../../../core/routing/routs.dart';
import '../../../../../core/theaming/color_healper.dart';
import '../../logic/cubit/login_cubit.dart';
import '../../logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        print('Current state: $state');
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsHelper.darkGreen,
                ),
              ),
            );
          },
          success: (loginResponse) {
            print('Success state reached with response: $loginResponse');

            Navigator.pop(context);
            Navigator.pushNamed(
              context,
              Routes.profileScreen,
              arguments: {
                "username": loginResponse.userData?.userName ?? "Unknown",
                "email": loginResponse.userData?.email ?? "",
                
              },
            );
          },
          error: (error) {
            print('Error state reached: $error');
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(
          Icons.error,
          color: ColorsHelper.darkGreen,
          size: 32.sp,
        ),
        content: Text(
          error,
          style: FontsHelper.font14Gray400,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'اغلاق',
              style: FontsHelper.font16DarkGreen400,
            ),
          ),
        ],
      ),
    );
  }
}
