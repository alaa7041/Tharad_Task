import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tharad_tech/features/profile/data/repositories/register_repo.dart';
import '../../../../../core/helpers/image_helper.dart';
import '../data/models/update_profile_request_body.dart';
import 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this.updateProfileRepo)
      : super(const UpdateProfileState.initial());

  final UpdateProfileRepo updateProfileRepo;
  File? selectedImage;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordConfirmation = TextEditingController();
  final TextEditingController newPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> selectImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      emit(UpdateProfileState.imageSelected(selectedImage!));
    }
  }

  Future<void> emitUpdateProfiileStates(BuildContext context,
      {String? imageUrl}) async {
    if (!formKey.currentState!.validate()) return;

    emit(const UpdateProfileState.loading());

    try {
      File? imageFile = selectedImage;
      if (imageUrl != null && imageFile == null) {
        imageFile = await urlToFile(imageUrl);
      }

      final formData = await UpdateProfileRequestBody(
        username: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        newPassword: newPassword.text,
        newPasswordConfirmation: newPasswordConfirmation.text,
        method: "PUT",
        image: imageFile,
      ).toMultipartForm();
      final response = await updateProfileRepo.profileUpdate(formData);

      response.when(success: (updateProfileResponse) {
        emit(UpdateProfileState.success(updateProfileResponse));
      }, failure: (error) {
        emit(UpdateProfileState.error(
            error: error.apiErrorModel.message ?? 'An error occurred'));
      });
    } catch (e) {
      emit(UpdateProfileState.error(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    newPassword.dispose();
    newPasswordConfirmation.dispose();
    return super.close();
  }
}
