import 'package:consumo_api_entrevista/features/pages/meal_description.dart';
import 'package:consumo_api_entrevista/features/pages/meal_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../dependencies/dependency_injection.dart';
import '../domain/entities/meal.dart';

class MealPage extends ConsumerStatefulWidget {
  const MealPage({super.key});

  @override
  MealPageState createState() => MealPageState();
}

class MealPageState extends ConsumerState<MealPage> {
  void getMeals([String meal = '']) async {
    final obtainedMeals = await ref.read(getConcreteMeal).getMeal(meal);
    ref.read(meals.notifier).replace(obtainedMeals);
  }

  @override
  void initState() {
    super.initState();
    getMeals();
  }

  @override
  Widget build(BuildContext context) {
    List<Meal> stateMeals = ref.watch(meals);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: getMeals,
          ),
          SizedBox(
            height: height / 1.5,
            width: width,
            child: ListView.builder(
                    itemCount: stateMeals.length,
                    itemBuilder: (context, index) {
                      final meal = stateMeals[index];

                      return Card(
                        child: Material(
                          child: InkWell(
                            onTap: () => Navigator.of(context).push(
                                CupertinoModalPopupRoute(
                                    builder: (context) =>
                                        MealDescriptionPage(meal: meal))),
                            child: Padding(
                              padding: const EdgeInsets.all(50.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.network(meal.strMealThumb, scale: 10),
                                  Expanded(
                                      child: Center(
                                          child: Text(
                                    meal.strMeal,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20),
                                  ))),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
          ),
        ],
      ),
    );
  }
}
