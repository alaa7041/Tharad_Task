import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/theaming/color_healper.dart';
import 'package:tharad_tech/core/theaming/fonts_helper.dart';

class InputField extends StatefulWidget {
  final String labelText;
  final bool obscureText, isPassword, isPhone;
  final Widget? widget;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function()? onTap;

  const InputField({
    super.key,
    required this.labelText,
    this.obscureText = false,
    this.isPassword = false,
    this.isPhone = false,
    this.widget,
    this.controller,
    this.validator,
    this.onTap,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: FontsHelper.font16DarkGreen400,
        ),
        Container(
          height: 70.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          margin: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: ColorsHelper.lighterGreen,
              border: Border.all(color: ColorsHelper.lighterGreen)),
          child: Column(
            children: [
              TextFormField(
                controller: widget.controller,
                obscureText: widget.isPassword && isPasswordHidden,
                keyboardType: TextInputType.text,
                validator: widget.validator,
                onTap: widget.onTap,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.w),
                  icon: widget.widget,
                  border: InputBorder.none,
                  suffixIcon: widget.isPassword
                      ? InkWell(
                          child: Icon(isPasswordHidden
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                          onTap: () {
                            isPasswordHidden = !isPasswordHidden;
                            setState(() {});
                          },
                        )
                      : SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
