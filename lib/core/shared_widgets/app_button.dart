import 'package:flutter/material.dart';
import 'package:tharad_tech/core/theaming/color_healper.dart';

class AppButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final double height;
  final double? radius;
  final Widget? widget;
  final BoxBorder? boxBorder;
  final double? boxWidth;

  final Function()? onPerssed;
  final double width;

  const AppButton(
      {super.key,
      required this.text,
      required this.textStyle,
      required this.height,
      this.onPerssed,
      this.width = double.infinity,
      this.radius = 0,
      this.boxBorder,
      this.widget = const SizedBox(),
      this.boxWidth = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        border: boxBorder,
        gradient: gradientAppColorList,
      ),
      child: TextButton(
        onPressed: onPerssed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: textStyle,
            ),
            SizedBox(
              width: boxWidth,
            ),
            Row(
              children: [
                widget!,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
