import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/business_logic/cubit/categories/categories_cubit.dart';
import 'package:food/data/models/meal.dart';
import 'package:food/data/models/meal_detail.dart';
import 'package:food/presentation/screens/home/home_screen.dart';
import 'package:food/presentation/screens/meal_detail/meal_detail_screen.dart';

onGenerateRoute(RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case '/':
      builder = (BuildContext _) => BlocProvider(
            create: (context) => CategoriesCubit(),
            child: const HomeScreen(),
          );
      break;
    case 'meal-detail':
      final Meal meal = settings.arguments as Meal;
      builder = (BuildContext _) => MealDetailScreen(
            meal: meal,
            mealDetail: mealDetail,
          );
      break;
    default:
      throw Exception('Invalid route: ${settings.name}');
  }
  return MaterialPageRoute(builder: builder, settings: settings);
}
