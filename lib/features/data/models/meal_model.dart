import 'package:consumo_api_entrevista/features/domain/entities/meal.dart';

class MealModel extends Meal {
  const MealModel(
      {required super.idMeal,
      required super.strMeal,
      required super.strMealThumb,
      required super.strArea});

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      strArea: json['strArea']);
}
