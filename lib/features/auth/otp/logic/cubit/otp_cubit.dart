import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tharad_tech/features/auth/otp/data/repos/otp_repo.dart';
import 'package:tharad_tech/features/auth/otp/logic/cubit/otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final OtpRepo otpRepo;

  OtpCubit(this.otpRepo) : super(const OtpState.initial());
 

  void verifyOtp(String email, int otp) async {
    emit(OtpState.loading());
    final response = await otpRepo.verifyOtp(email, otp);
    response.when(success: (otpResponse) async {
      emit(OtpState.success(otpResponse));
    }, failure: (error) {
      emit(OtpState.error(error: error.apiErrorModel.message ?? ""));
    });
  }
}
