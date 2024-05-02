import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      required this.title,
      required this.meals,
      required this.toggleMealFavoriteStatus});

  final String title;
  final List<Meal> meals;
  final void Function(Meal) toggleMealFavoriteStatus;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
            meal: meal, toggleMealFavoriteStatus: toggleMealFavoriteStatus),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh! No meals found!',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(height: 20),
          Text(
            'Try picking a different category!',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemBuilder: (ctx, index) => MealItem(
            meal: meals[index],
            onSelected: () {
              _selectMeal(context, meals[index]);
            }),
        itemCount: meals.length,
        // padding: const EdgeInsets.all(16),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
