import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/di/dependancy_injection.dart';
import 'package:tharad_tech/core/theaming/fonts_helper.dart';

import '../../../core/theaming/color_healper.dart';
import '../../auth/logout/logic/cubit/logout_cubit.dart';
import '../../auth/logout/logic/logout_bloc_consumer.dart';
import 'widgets/profile_form.dart';

class ProfileScreen extends StatelessWidget {
  final String username;
  final String email;

  const ProfileScreen({
    super.key,
    required this.username,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: gradientAppColorList,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 60.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Text("الملف الشخصي", style: FontsHelper.font16White700),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.logout, color: Colors.white),
                      onPressed: () {
                        showLogoutConfirmationDialog(context, () {
                          Navigator.pop(context);
                          context
                              .read<LogoutCubit>()
                              .emitLogout(); // Logout action
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.w),
                height: MediaQuery.of(context).size.height / 1.26,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: ProfileForm(email: email, username: username),
                ),
              ),
            ),
            LogoutBlocListener(), // Ensure LogoutCubit is available to this widget
          ],
        ),
      ),
    );
  }

  void showLogoutConfirmationDialog(BuildContext context, Function() onLogout) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:
            Text('تأكيد تسجيل الخروج', style: FontsHelper.font16DarkGreen400),
        content: Text('هل أنت متأكد أنك تريد تسجيل الخروج؟',
            style: FontsHelper.font14Gray400),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('إلغاء', style: FontsHelper.font16DarkGreen400),
          ),
          TextButton(
            onPressed: onLogout,
            child: Text('تسجيل الخروج', style: FontsHelper.font16DarkGreen400),
          ),
        ],
      ),
    );
  }
}
