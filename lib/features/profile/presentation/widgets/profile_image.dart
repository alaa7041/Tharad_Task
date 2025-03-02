import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tharad_tech/core/theaming/fonts_helper.dart';

class ProfileImageContainer extends StatelessWidget {
  final Function()? onTap;
  final File? imageFile;
  final String? imageUrl; // Image from response

  ProfileImageContainer(
      {super.key, required this.onTap, this.imageFile, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 8.0, bottom: 5),
          child: Text(
            'الصورة الشخصية',
            style: FontsHelper.font14DarkGreen400,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12.r),
                    image: imageFile != null
                        ? DecorationImage(
                            image: FileImage(imageFile!),
                            fit: BoxFit.cover,
                          )
                        : imageUrl != null
                            ? DecorationImage(
                                image: NetworkImage(imageUrl!),
                                fit: BoxFit.cover,
                              )
                            : null,
                  ),
                  child: (imageFile == null && imageUrl == null)
                      ? CustomPaint(
                          painter: DottedBorderPainter(),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: 120.h,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/camera.png',
                                  height: 40.h,
                                  color: Colors.teal,
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  'الملفات المسموح بها: PNG, JPEG',
                                  style: FontsHelper.font14Gray400,
                                ),
                                Text(
                                  'الحد الأقصى: 5MB',
                                  style: FontsHelper.font14Gray400,
                                ),
                              ],
                            ),
                          ),
                        )
                      : null,
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.teal,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double dashWidth = 6, dashSpace = 4;
    double startX = 0;
    final Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height), Radius.circular(10)));

    Path dashedPath = Path();
    for (PathMetric pathMetric in path.computeMetrics()) {
      double distance = 0;
      while (distance < pathMetric.length) {
        dashedPath.addPath(
            pathMetric.extractPath(distance, distance + dashWidth),
            Offset.zero);
        distance += dashWidth + dashSpace;
      }
    }
    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
