import 'package:flutter/material.dart';
import 'package:food/data/models/meal_detail.dart';
import 'package:food/presentation/screens/meal_detail/widgets/ingredient_modal_bottom_sheet.dart';
import 'package:food/utils/color_manager.dart';
import 'package:sizer/sizer.dart';

class IngredientButton extends StatelessWidget {
  final MealDetail mealDetails;
  const IngredientButton({
    super.key,
    required this.mealDetails,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                40,
              ),
              topLeft: Radius.circular(
                40,
              ),
            ),
          ),
          builder: (context) => IngredientModalBottomSheet(
            mealDetails: mealDetails,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 2.h,
          horizontal: 3.w,
        ),
        decoration: BoxDecoration(
          color: ColorManager.lightGreen,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Text(
              "Ingredient",
              style: TextStyle(
                fontSize: 18.sp,
                color: ColorManager.grey,
              ),
            ),
            const Spacer(),
            Text(
              "${mealDetail.ingredients.length} items",
              style: TextStyle(
                fontSize: 18.sp,
                color: ColorManager.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}