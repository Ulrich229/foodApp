import 'package:flutter/material.dart';
import 'package:food/data/models/meal.dart';
import 'package:food/presentation/screens/meal_detail/meal_detail_screen.dart';
import 'package:food/presentation/widgets/custom_icon.dart';
import 'package:food/presentation/widgets/meal_stats_widget.dart';
import 'package:food/utils/color_manager.dart';
import 'package:sizer/sizer.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              InkWell(
                onTap: () => Navigator.of(context).pushNamed(
                  MealDetailScreen.routeName,
                  arguments: meal,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  elevation: 12,
                  child: Hero(
                    tag: meal.id,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 1.h,
                      ),
                      height: 90.w - 100,
                      width: 90.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                          image: AssetImage(meal.imagePath),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                  vertical: 1.h,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 5.w,
                  vertical: 2.h,
                ),
                decoration: BoxDecoration(
                    color: ColorManager.lightGrey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      meal.stars.toString(),
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    CustomIcon(
                      iconFileName: "star.png",
                      width: 3.w,
                      height: 3.w,
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            meal.name,
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 10.sp,
                backgroundImage: AssetImage(
                  meal.creator.profilePictureUrl,
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                meal.creator.name,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: ColorManager.grey,
                ),
              ),
              const Spacer(),
              MealStatsWidget(
                stat: meal.comments.toString(),
                iconPath: "comment.png",
              ),
              SizedBox(
                width: 4.w,
              ),
              MealStatsWidget(
                stat: meal.likes,
                iconPath: "colored_fav.png",
              ),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
        ],
    );
  }
}
