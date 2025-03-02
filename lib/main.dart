import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tharad_tech/core/helpers/bloc_observer.dart';
import 'package:tharad_tech/core/routing/routs.dart';
import 'core/di/dependancy_injection.dart';
import 'core/routing/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter(); 
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  runApp(DevicePreview(
    builder: (context) => TharadApp(
      appRouter: AppRouter(),
    ),
  ));
}

class TharadApp extends StatelessWidget {
  final AppRouter appRouter;
  const TharadApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        builder: DevicePreview.appBuilder,
        title: "Tharad App",
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        locale: const Locale('ar'),
        supportedLocales: const [
          Locale('en', ''),
          Locale('ar', ''),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (locale != null &&
                locale.languageCode == supportedLocale.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first; // Default to first locale
        },
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.SplashScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
