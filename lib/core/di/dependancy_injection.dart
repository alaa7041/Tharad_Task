import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tharad_tech/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:tharad_tech/features/auth/logout/data/repos/logout_repo.dart';
import 'package:tharad_tech/features/auth/otp/data/repos/otp_repo.dart';
import 'package:tharad_tech/features/auth/otp/logic/cubit/otp_cubit.dart';
import 'package:tharad_tech/features/auth/register/logic/cubit/register_cubit.dart';
import 'package:tharad_tech/features/profile/cubit/update_profile_cubit.dart';
import 'package:tharad_tech/features/profile/data/repositories/register_repo.dart';
import '../../features/auth/login/data/repos/login_repo.dart';
import '../../features/auth/logout/logic/cubit/logout_cubit.dart';
import '../../features/auth/register/data/repositories/register_repo.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

// signup
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

  // otp
  getIt.registerLazySingleton<OtpRepo>(() => OtpRepo(getIt()));
  getIt.registerFactory<OtpCubit>(() => OtpCubit(getIt()));
  // update profile
  getIt.registerLazySingleton<UpdateProfileRepo>(
      () => UpdateProfileRepo(getIt()));
  getIt.registerFactory<UpdateProfileCubit>(() => UpdateProfileCubit(getIt()));
  // logout

  getIt.registerLazySingleton<LogoutRepo>(() => LogoutRepo(getIt()));
  getIt.registerFactory<LogoutCubit>(() => LogoutCubit(getIt()));
}
