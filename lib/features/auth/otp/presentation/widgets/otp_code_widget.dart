import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:tharad_tech/core/theaming/color_healper.dart';
import 'package:tharad_tech/core/theaming/fonts_helper.dart';

class OtpCodeWidget extends StatefulWidget {
  const OtpCodeWidget({
    Key? key,
  }) : super(key: key);

  @override
  _OtpCodeWidgetState createState() => _OtpCodeWidgetState();
}

class _OtpCodeWidgetState extends State<OtpCodeWidget> {
  String otpCode = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Pinput(
          length: 4,
          defaultPinTheme: PinTheme(
            width: 50.w,
            height: 50.h,
            textStyle: FontsHelper.font14DarkGreen400,
            decoration: BoxDecoration(
              color: ColorsHelper.lighterGreen,
              border: Border.all(color: ColorsHelper.lighterGreen),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onCompleted: (pin) {
            otpCode = pin;
          },
        ),
      ],
    );
  }
}
