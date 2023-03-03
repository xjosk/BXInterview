import 'package:consumo_api_entrevista/features/domain/entities/meal_description.dart';

import '../entities/meal.dart';

abstract class MealRepository {
  Future<List<Meal>> getConcreteMeal(String name);
  Future<MealDescription> getMealDescription(String idMeal);
}
