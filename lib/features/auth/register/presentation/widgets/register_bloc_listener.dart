import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tharad_tech/core/helpers/extentions.dart';
import 'package:tharad_tech/core/shared_widgets/toast.dart';
import '../../../../../core/routing/routs.dart';
import '../../../../../core/theaming/color_healper.dart';
import '../../../../../core/theaming/fonts_helper.dart';
import '../../logic/cubit/register_cubit.dart';
import '../../logic/cubit/register_state.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(loading: () {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(color: ColorsHelper.darkGreen),
            ),
          );
        }, success: (registerResponse) {
          context.pop();
          if (registerResponse.userData.otp == null ||
              registerResponse.userData.otp.toString().isEmpty) {
            print("Error: OTP is null or empty");
            return;
          }
          Navigator.pushReplacementNamed(
            context,
            Routes.otpScreen,
            arguments: {
              "email": context.read<RegisterCubit>().emailController.text,
              "otp": registerResponse.userData.otp,
            },
          );
          showToast(
            "Otp Code is: ${registerResponse.userData.otp}",
            ColorsHelper.darkGreen,
            Colors.white,
          );
        }, error: (message) {
          context.pop();
          setupErrorState(context, message);
        });
      },
      child: const SizedBox.shrink(),
    );
  }
}

void setupErrorState(BuildContext context, String error) {
  context.pop();

  Fluttertoast.showToast(
    msg: error,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.sp,
  );
}
