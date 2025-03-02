import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tharad_tech/core/helpers/extentions.dart';
import 'package:tharad_tech/core/shared_widgets/toast.dart';
import 'package:tharad_tech/features/profile/cubit/update_profile_state.dart';
import '../../../../../core/theaming/color_healper.dart';
import '../../../../core/routing/routs.dart';
import '../../cubit/update_profile_cubit.dart';

class UpdateProfileBlocListener extends StatelessWidget {
  const UpdateProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(loading: () {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(color: ColorsHelper.darkGreen),
            ),
          );
        }, success: (updateProfileResponse) {
          context.pop();
          print(
              "updateProfileResponse:>>>>>>>>>>>>>>>>> $updateProfileResponse");
          context.pop();
          final userData = updateProfileResponse.userData;
          showToast(
              "تم تحديث بيانات المستخدم", ColorsHelper.darkGreen, Colors.white);
          if (userData != null) {
            context.pushNamed(
              Routes.profileScreen,
              arguments: {
                "id": userData.id,
                "username": userData.userName,
                "email": userData.email,
                "image": userData.image ?? userData.imageUrl,
              },
            );
          }
        }, error: (message) {
          context.pop();
          setupErrorState(context, message);
        });
      },
      child: const SizedBox.shrink(),
    );
  }
}

void setupErrorState(BuildContext context, String error) {
  Fluttertoast.showToast(
    msg: error,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.sp,
  );
}
