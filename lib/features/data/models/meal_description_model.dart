import 'package:consumo_api_entrevista/features/domain/entities/meal_description.dart';

class MealDescriptionModel extends MealDescription {
  const MealDescriptionModel(
      {required super.strCategory,
      required super.strArea,
      required super.strInstruction});

  factory MealDescriptionModel.fromJson(Map<String, dynamic> json) =>
      MealDescriptionModel(
          strCategory: json['strCategory'],
          strArea: json['strArea'],
          strInstruction: json['strInstructions']);
}
