import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/hive_helper.dart';
import '../../../../../core/networking/dio_factory.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/logout_repo.dart';
import 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutRepo logoutRepo;

  LogoutCubit(this.logoutRepo) : super(const LogoutState.initial());

  void emitLogout() async {
    emit(const LogoutState.loading());
    try {
      await logoutRepo.logout();
      await HiveHelper.removeToken();
      emit(LogoutState.success("Logout successfully"));
    } catch (e) {
      emit(LogoutState.error(error: 'Logout failed : $e'));
    }
  }
}
