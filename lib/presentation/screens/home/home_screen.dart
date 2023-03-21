import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food/business_logic/cubit/categories/categories_cubit.dart';
import 'package:food/data/models/meal.dart';
import 'package:food/data/models/user.dart';
import 'package:food/presentation/screens/home/widgets/category_item.dart';
import 'package:food/presentation/widgets/meal_item.dart';
import 'package:food/presentation/screens/home/widgets/top_chef_item.dart';
import 'package:food/presentation/widgets/custom_icon.dart';
import 'package:food/utils/color_manager.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _page;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    _page = 0;
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    //pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Foodbook',
          style: TextStyle(
              color: ColorManager.green,
              fontSize: 25.sp,
              fontFamily: 'MuseoModerno'),
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
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Top chefs",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: ColorManager.grey,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: topchefs
                        .map(
                          (topChef) => TopChefItem(
                            user: topChef,
                            index: topchefs.indexOf(topChef),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                BlocBuilder<CategoriesCubit, CategoriesState>(
                  builder: (context, state) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: state.categories
                            .map(
                              (category) => CategoryItem(
                                isSelected:
                                    state.categories.indexOf(category) ==
                                        state.selectedCategoryIndex,
                                onTap: () {
                                  BlocProvider.of<CategoriesCubit>(context)
                                      .selectCategory(
                                    state.categories.indexOf(category),
                                  );
                                },
                                category: category,
                                index: state.categories.indexOf(category),
                              ),
                            )
                            .toList(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                ...dummyMeals
                    .map((meal) => RepaintBoundary(
                          child: MealItem(
                            meal: meal,
                          )
                              .animate()
                              .fadeIn(
                                duration: 1000.ms,
                                curve: Curves.fastOutSlowIn,
                              )
                              .then()
                              .shimmer(),
                        ))
                    .toList(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RepaintBoundary(
            key: LabeledGlobalKey("1"),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
                vertical: 1.5.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: ColorManager.green,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomIcon(
                    iconFileName: "add_white.png",
                    width: 4.w,
                    height: 4.w,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "Add reciepe",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ).animate().slideY(delay: 1.seconds, begin: 4),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BottomNavigationBar(
                elevation: 12,
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 0,
                backgroundColor: Colors.white,
                items: <BottomNavigationBarItem>[
                  buildBottomNavigationBarItem(
                    activeIconPath: "menu.png",
                    label: "Home",
                    isSelected: _page == 0,
                  ),
                  buildBottomNavigationBarItem(
                    activeIconPath: "fav.png",
                    label: "Home",
                    isSelected: _page == 1,
                  ),
                  buildBottomNavigationBarItem(
                    activeIconPath: "bag.png",
                    label: "Cart",
                    isSelected: _page == 2,
                  ),
                  buildBottomNavigationBarItem(
                    activeIconPath: "person.png",
                    label: "Profile",
                    isSelected: _page == 3,
                  ),
                ],
                onTap: navigationTapped,
                currentIndex: _page,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}

BottomNavigationBarItem buildBottomNavigationBarItem({
  required String activeIconPath,
  required String label,
  required bool isSelected,
}) {
  return BottomNavigationBarItem(
    icon: SizedBox(
      height: AppBar().preferredSize.height,
      child: isSelected
          ? Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Home",
                  style: TextStyle(
                    color: ColorManager.green,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                CircleAvatar(
                  backgroundColor: ColorManager.green,
                  radius: 2.sp,
                )
              ],
            )
          : Container(
              height: 4.w,
              width: 4.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/$activeIconPath'),
                ),
              ),
            ),
    ),
    label: '',
    backgroundColor: ColorManager.green,
  );
}
