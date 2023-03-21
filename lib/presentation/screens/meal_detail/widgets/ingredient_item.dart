import 'package:flutter/material.dart';
import 'package:food/data/models/ingredient.dart';
import 'package:food/presentation/widgets/custom_icon.dart';
import 'package:food/utils/color_manager.dart';
import 'package:sizer/sizer.dart';

class IngredientItem extends StatefulWidget {
  final Ingredient ingredient;
  final int index;
  final Function(bool) onTap;
  const IngredientItem({
    super.key,
    required this.ingredient,
    required this.onTap,
    required this.index,
  });

  @override
  State<IngredientItem> createState() => _IngredientItemState();
}

class _IngredientItemState extends State<IngredientItem> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 30.h,
        width: 45.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.grey.withOpacity(
              0.5,
            ),
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          children: [
            const Spacer(),
            SizedBox(
              height: 12.h,
              width: 12.h,
              child:Image.asset(
                  widget.ingredient.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              widget.ingredient.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Text(
              "${widget.ingredient.pieces} piece${widget.ingredient.pieces > 1 ? "s" : ""}",
              style: TextStyle(
                color: ColorManager.grey,
                fontSize: 10.sp,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
                vertical: 4.w,
              ),
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                  widget.onTap(isSelected);
                },
                padding: EdgeInsets.symmetric(
                  vertical: 2.h,
                ),
                color: isSelected ? ColorManager.green : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    50,
                  ),
                  side: const BorderSide(
                    color: ColorManager.green,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIcon(
                      iconFileName: isSelected ? 'check.png' : 'add.png',
                      height: 3.w,
                      width: 3.w,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      isSelected ? "added" : "add to bag",
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: isSelected ? Colors.white : ColorManager.green,
                      ),
                    ),
                  ], /* 
                      ), */
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
