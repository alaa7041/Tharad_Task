import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tharad_tech/core/helpers/extentions.dart';
import 'package:tharad_tech/core/routing/routs.dart';

import '../../../../../core/helpers/image_helper.dart';
import '../../data/models/register_request_body.dart';
import '../../data/repositories/register_repo.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(const RegisterState.initial());

  final RegisterRepo registerRepo;
  File? selectedImage;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  /// Function to select image from gallery
  Future<void> selectImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      emit(RegisterState.imageSelected(selectedImage!)); // Notify UI
    }
  }

  /// Function to handle user registration
  Future<void> emitRegisterStates(BuildContext context,
      {String? imageUrl}) async {
    if (!formKey.currentState!.validate()) return;

    emit(const RegisterState.loading());

    try {
      File? imageFile = selectedImage;

      // If an image URL is provided, convert it to a File
      if (imageUrl != null && imageFile == null) {
        imageFile = await urlToFile(imageUrl);
      }

      final formData = await RegisterRequestBody(
        username: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        image: imageFile,
      ).toMultipartForm();
      final response = await registerRepo.register(formData);

      response.when(success: (registerResponse) {
        emit(RegisterState.success(registerResponse));
          print("Received Register Response otp:::::::::::::::::::::::: ${registerResponse.userData!.otp.toString()}");

        context.pushNamed(
          Routes.otpScreen,
          arguments: {
            "email": emailController.text,
            "otp": registerResponse.userData!.otp,
          },
        );
      }, failure: (error) {
        emit(RegisterState.error(
            error: error.apiErrorModel.message ?? 'An error occurred'));
      });
    } catch (e) {
      emit(RegisterState.error(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    return super.close();
  }
}
