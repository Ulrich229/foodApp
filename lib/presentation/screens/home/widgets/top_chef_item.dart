import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food/data/models/user.dart';
import 'package:food/utils/color_manager.dart';
import 'package:sizer/sizer.dart';

class TopChefItem extends StatelessWidget {
  final User user;
  final int index;
  const TopChefItem({
    Key? key,
    required this.user,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: LabeledGlobalKey(user.id),
      child: Padding(
        padding: EdgeInsets.only(
          right: 3.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 20.sp,
              backgroundImage: AssetImage(
                user.profilePictureUrl,
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Text(
              user.name,
              style: TextStyle(fontSize: 10.sp, color: ColorManager.grey),
            ),
          ],
        ),
      ).animate().slideX(
            begin: 7,
            curve: Curves.easeInOut,
            delay: (100 * index).ms,
            duration: 500.ms,
          ),
    );
  }
}
