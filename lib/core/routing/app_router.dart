import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tharad_tech/core/routing/routs.dart';
import 'package:tharad_tech/features/auth/login/presentation/login_screen.dart';
import 'package:tharad_tech/features/auth/otp/logic/cubit/otp_cubit.dart';
import 'package:tharad_tech/features/auth/otp/presentation/otp_screen.dart';
import 'package:tharad_tech/features/auth/register/presentation/register_screen.dart';
import 'package:tharad_tech/features/profile/presentation/profile_screen.dart';

import '../../features/auth/login/logic/cubit/login_cubit.dart';
import '../../features/auth/logout/logic/cubit/logout_cubit.dart';
import '../../features/auth/register/logic/cubit/register_cubit.dart';
import '../../features/profile/cubit/update_profile_cubit.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../di/dependancy_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.SplashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: const LoginScreen()),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => getIt<RegisterCubit>(),
              child: const RegisterScreen()),
        );

      case Routes.otpScreen:
        final args = settings.arguments as Map<String, dynamic>?;

        if (args == null ||
            !args.containsKey("email") ||
            !args.containsKey("otp")) {
          print("Navigation Error: OTP or email is missing!");
          return null;
        }

        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<OtpCubit>(),
            child: OtpScreen(
              email: args["email"] ?? "",
              otp: args["otp"] ?? 0,
            ),
          ),
        );

      case Routes.profileScreen:
  return MaterialPageRoute(
    builder: (context) {
      final args = settings.arguments as Map<String, dynamic>;

      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<UpdateProfileCubit>()),
          BlocProvider(create: (context) => getIt<LogoutCubit>()), // Use getIt here
        ],
        child: ProfileScreen(
          username: args['username'],
          email: args['email'],
        ),
      );
    },
  );


      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("No Route defined ${settings.name}"),
            ),
          ),
        );
    }
  }
}
