import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> splashScreenTimer() async {
    Timer(const Duration(seconds: 3), () {
      emit(StartState());
    });
  }
}
