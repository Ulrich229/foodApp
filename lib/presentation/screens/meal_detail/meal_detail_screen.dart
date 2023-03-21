import 'package:flutter/material.dart';
import 'package:food/presentation/screens/meal_detail/widgets/ingredient_button.dart';
import 'package:food/presentation/screens/meal_detail/widgets/serving_count.dart';
import 'package:food/presentation/widgets/custom_icon.dart';
import 'package:food/presentation/widgets/meal_item.dart';
import 'package:food/utils/color_manager.dart';
import 'package:sizer/sizer.dart';

import 'package:food/data/models/meal.dart';
import 'package:food/data/models/meal_detail.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;
  final MealDetail mealDetail;
  const MealDetailScreen({
    Key? key,
    required this.meal,
    required this.mealDetail,
  }) : super(key: key);

  static const String routeName = 'meal-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Container(
            height: 5.w,
            width: 5.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/arrow_back.png'),
              ),
            ),
          ),
        ),
        actions: [
          Container(
            height: 4.5.w,
            width: 4.5.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/search.png'),
              ),
            ),
          ),
          SizedBox(
            width: 3.w,
          ),
          Container(
            height: 4.5.w,
            width: 4.5.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/bell.png'),
              ),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MealItem(meal: meal,),
                Row(
                  children: [
                    const CustomIcon(iconFileName: "timer.png"),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "${mealDetail.duration.inMinutes} minutes",
                      style: TextStyle(
                        color: ColorManager.grey,
                        fontSize: 14.sp,
                      ),
                    ),
                    const Spacer(),
                    const CustomIcon(iconFileName: "evolution.png"),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      mealDetail.mealDifficulty.toString(),
                      style: TextStyle(
                        color: ColorManager.grey,
                        fontSize: 14.sp,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "# ${mealDetail.hashtag}",
                      style: TextStyle(
                        color: ColorManager.green,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                const ServingCount(),
                SizedBox(
                  height: 2.h,
                ),
                IngredientButton(mealDetails: mealDetail),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal:  15.w),
        child: MaterialButton(
          onPressed: () {},
          color: ColorManager.green,
          padding: EdgeInsets.symmetric(
            horizontal: 3.w,
            vertical: 2.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              50,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomIcon(iconFileName: 'play.png'),
              SizedBox(
                width: 3.w,
              ),
              Text(
                "Start cooking",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
