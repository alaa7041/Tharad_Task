import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/helpers/extentions.dart';
import 'package:tharad_tech/core/theaming/color_healper.dart';
import 'package:tharad_tech/features/auth/logout/logic/cubit/logout_cubit.dart';

import '../../../../core/routing/routs.dart';
import '../../../../core/theaming/fonts_helper.dart';
import 'cubit/logout_state.dart';

class LogoutBlocListener extends StatelessWidget {
  const LogoutBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        print('Current state: $state');

        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: ColorsHelper.darkGreen),
              ),
            );
          },
          success: (message) {
            print('Logout success: $message');
            Navigator.pop(context);

            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.loginScreen,
              (route) => false,
            );
          },
          error: (error) {
            print('Logout error: $error');
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
        icon: Icon(Icons.error, color: ColorsHelper.darkGreen, size: 32.sp),
        content: Text(error, style: FontsHelper.font14Gray400),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text('إغلاق', style: FontsHelper.font16DarkGreen400),
          ),
        ],
      ),
    );
  }
}
