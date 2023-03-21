import 'package:flutter/material.dart';
import 'package:food/utils/color_manager.dart';
import 'package:sizer/sizer.dart';

class ServingCount extends StatefulWidget {
  const ServingCount({
    super.key,
  });

  @override
  State<ServingCount> createState() => _ServingCountState();
}

class _ServingCountState extends State<ServingCount> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 1.h,
        horizontal: 3.w,
      ),
      decoration: BoxDecoration(
        color: ColorManager.lightGrey,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Text(
            "Servings",
            style: TextStyle(
              fontSize: 16.sp,
              color: ColorManager.grey,
            ),
          ),
          const Spacer(),
          ServingCountItem(
            iconPath: "minus.png",
            onTap: () {
              if (count > 1) {
                setState(() {
                  count--;
                });
              }
            },
          ),
          SizedBox(
            width: 5.w,
          ),
          CircleAvatar(
            radius: 13.sp,
            backgroundColor: Colors.white,
            child: Text(
              "${count > 9 ? "" : "0"}$count",
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          ServingCountItem(
            iconPath: "add_white.png",
            onTap: () {
              setState(() {
                count++;
              });
            },
          ),
        ],
      ),
    );
  }
}

class ServingCountItem extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;
  const ServingCountItem({
    super.key,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 8.sp,
        backgroundColor: ColorManager.green,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset("assets/icons/$iconPath"),
        ),
      ),
    );
  }
}
