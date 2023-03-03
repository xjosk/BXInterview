import 'package:consumo_api_entrevista/features/domain/entities/meal.dart';
import 'package:consumo_api_entrevista/features/domain/usecases/get_concrete_meal_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../domain/entities/meal_description.dart';

class MealDescriptionPage extends StatefulWidget {
  const MealDescriptionPage({super.key, required this.meal});

  final Meal meal;

  @override
  State<MealDescriptionPage> createState() => _MealDescriptionPageState();
}

class _MealDescriptionPageState extends State<MealDescriptionPage> {
  late final GetIt getIt;
  late final GetConcreteMeal getConcreteMeal;
  MealDescription? mealDescription;

  void getMealDescription() async {
    mealDescription =
        await getConcreteMeal.getMealDescription(widget.meal.idMeal);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getIt = GetIt.instance;
    getConcreteMeal = getIt.call();
    getMealDescription();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.strMeal),
      ),
      body: mealDescription == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                  Image.network(widget.meal.strMealThumb),
                  SizedBox(height: 20,),
                  Text(mealDescription!.strInstruction, textAlign: TextAlign.justify,)
                ]),
            ),
          ),
    );
  }
}
