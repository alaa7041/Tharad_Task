import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/routing/routs.dart';
import '../domin/cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..splashScreenTimer(),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          Navigator.pushNamed(context, Routes.loginScreen);
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Image.asset(
                  "assets/logo.png",
                  height: 100.h,
                  width: 200.w,
                ),
              ));
        },
      ),
    );
  }
}
