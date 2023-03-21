import 'package:flutter/material.dart';
import 'package:food/presentation/widgets/custom_icon.dart';
import 'package:food/utils/color_manager.dart';
import 'package:sizer/sizer.dart';

class MealStatsWidget extends StatelessWidget {
  final String stat;
  final String iconPath;
  const MealStatsWidget({
    Key? key,
    required this.iconPath,
    required this.stat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          stat,
          style: TextStyle(
            fontSize: 11.sp,
            color: ColorManager.grey,
          ),
        ),
        SizedBox(
          width: 1.w,
        ),
        CustomIcon(
          iconFileName: iconPath,
        ),
      ],
    );
  }
}
