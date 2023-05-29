import 'package:consumo_api_entrevista/dependencies/dependency_injection.dart';
import 'package:consumo_api_entrevista/features/domain/entities/meal.dart';
import 'package:consumo_api_entrevista/features/domain/usecases/get_concrete_meal_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/meal_description.dart';

class MealDescriptionPage extends ConsumerStatefulWidget {
  const MealDescriptionPage({super.key, required this.meal});

  final Meal meal;

  @override
  MealDescriptionPageState createState() => MealDescriptionPageState();
}

class MealDescriptionPageState extends ConsumerState<MealDescriptionPage> {
  MealDescription? mealDescription;

  void getMealDescription() async {
    mealDescription =
        await ref.read(getConcreteMeal).getMealDescription(widget.meal.idMeal);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
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
                  const SizedBox(height: 20,),
                  Text(mealDescription!.strInstruction, textAlign: TextAlign.justify,)
                ]),
            ),
          ),
    );
  }
}
