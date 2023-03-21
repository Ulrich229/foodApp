import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food/utils/color_manager.dart';
import 'package:sizer/sizer.dart';

class CategoryItem extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String category;
  final int index;
  const CategoryItem({
    Key? key,
    required this.isSelected,
    required this.onTap,
    required this.category,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: LabeledGlobalKey(category),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 1.3.h,
            horizontal: 5.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.w),
            color: isSelected ? Colors.black : null,
          ),
          child: Text(
            category,
            style: TextStyle(
              color: isSelected ? Colors.white : ColorManager.grey,
              fontSize: 14.sp,
            ),
          ),
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
