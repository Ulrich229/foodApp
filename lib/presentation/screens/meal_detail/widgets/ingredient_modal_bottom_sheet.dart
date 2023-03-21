import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food/data/models/meal_detail.dart';
import 'package:food/presentation/screens/meal_detail/widgets/ingredient_item.dart';
import 'package:food/presentation/widgets/custom_icon.dart';
import 'package:food/utils/color_manager.dart';
import 'package:sizer/sizer.dart';

class IngredientModalBottomSheet extends StatefulWidget {
  final MealDetail mealDetails;
  const IngredientModalBottomSheet({
    super.key,
    required this.mealDetails,
  });

  @override
  State<IngredientModalBottomSheet> createState() =>
      _IngredientModalBottomSheetState();
}

class _IngredientModalBottomSheetState
    extends State<IngredientModalBottomSheet> {
  late int bagCount;

  @override
  void initState() {
    super.initState();
    bagCount = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          40,
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 3.h,
            ),
            Text(
              "Add ingredients you need to bag",
              style: TextStyle(
                fontSize: 11.sp,
                color: ColorManager.grey,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 7 / 9,
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.w,
                  mainAxisSpacing: 4.w,
                ),
                itemBuilder: (_, index) => RepaintBoundary(
                  child: IngredientItem(
                    ingredient: widget.mealDetails.ingredients[index],
                    index: index,
                    onTap: (value) {
                      if (value) {
                        setState(() {
                          bagCount++;
                        });
                      } else {
                        setState(() {
                          bagCount--;
                        });
                      }
                    },
                  ).animate().slideY(
                      begin: 3, duration: 500.ms, delay: (100 * index).ms),
                ),
                itemCount: widget.mealDetails.ingredients.length,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                5.w,
                1.w,
                5.w,
                5.w,
              ),
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
                  children: [
                    const CustomIcon(iconFileName: 'white_bag.png'),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      "Bag",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 13.sp,
                      backgroundColor: Colors.white,
                      child: Text(
                        "${bagCount > 9 ? "" : "0"}$bagCount",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: ColorManager.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
