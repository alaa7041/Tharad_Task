import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorNoDataWidget extends StatelessWidget {
  const ErrorNoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        spacing: 24.h,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Some thing warng"),
          
          SizedBox(
            height: 79.h,
            width: 79.w,
            child: Icon(Icons.error_rounded),
          ),
        ],
      ),
    );
  }
}
