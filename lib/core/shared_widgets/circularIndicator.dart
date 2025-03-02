import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tharad_tech/core/theaming/color_healper.dart';

class CircularIndicator extends StatelessWidget {
  final Color color;

  const CircularIndicator({
    super.key,
    this.color = ColorsHelper.darkGreen,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(
        color: color,
        size: 35.0,
      ),
    );
  }
}
