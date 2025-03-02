import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/helpers/extentions.dart';
import 'package:tharad_tech/core/helpers/spacing.dart';
import 'package:tharad_tech/core/routing/routs.dart';
import 'package:tharad_tech/core/shared_widgets/app_button.dart';
import 'package:tharad_tech/core/shared_widgets/toast.dart';
import 'package:tharad_tech/features/auth/otp/logic/cubit/otp_cubit.dart';
import '../../../../core/theaming/color_healper.dart';
import '../../../../core/theaming/fonts_helper.dart';
import '../logic/cubit/otp_state.dart';
import 'widgets/otp_code_widget.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  final int otp;

  const OtpScreen({super.key, required this.email, required this.otp});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 100.h),
          child: Column(
            spacing: 15.h,
            children: [
              Image.asset(
                "assets/logo.png",
                height: 100.h,
                width: 200.w,
              ),
              verticalSpace(35),
              Text("رمز التحقق", style: FontsHelper.font20Black600),
              Text(
                " لاستكمال فتح حسابك ادخل رمز التحقق المرسل عبر البريد الإلكتروني",
                style: FontsHelper.font14Gray400,
                textAlign: TextAlign.center,
              ),
              OtpCodeWidget(),
              BlocConsumer<OtpCubit, OtpState>(
                listener: (context, state) {
                  state.whenOrNull(
                    loading: () {
                      showDialog(
                        context: context,
                        builder: (context) => Center(
                          child: CircularProgressIndicator(
                              color: ColorsHelper.darkGreen),
                        ),
                      );
                    },
                    success: (otpResponse) {
                      context.pop();
                      showToast(otpResponse.message, ColorsHelper.darkGreen,
                          Colors.white);

                      context.pushReplacementNamed(
                        Routes.loginScreen,
                      );
                    },
                    error: (message) {
                      showToast(message, ColorsHelper.darkGreen, Colors.white);
                      context.pop();
                    },
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => AppButton(
                      text: "المتابعة",
                      textStyle: FontsHelper.font14LighterGreen400,
                      height: 50.h,
                      radius: 7.r,
                      onPerssed: () {
                        context
                            .read<OtpCubit>()
                            .verifyOtp(widget.email, widget.otp);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
