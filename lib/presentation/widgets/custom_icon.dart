import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomIcon extends StatelessWidget {
  final String iconFileName;
  final double? height;
  final double? width;
  const CustomIcon({
    Key? key,
    required this.iconFileName,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 5.w,
      width: width ?? 5.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/icons/$iconFileName",
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
