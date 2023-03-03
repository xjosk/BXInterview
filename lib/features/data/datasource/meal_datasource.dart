import 'dart:convert';

import 'package:consumo_api_entrevista/features/data/models/meal_description_model.dart';
import 'package:consumo_api_entrevista/features/data/models/meal_model.dart';
import 'package:consumo_api_entrevista/features/domain/entities/meal.dart';
import 'package:consumo_api_entrevista/features/domain/entities/meal_description.dart';
import 'package:http/http.dart' as http;

abstract class MealDataSource {
  Future<List<Meal>> getMealDataSource(String meal);
  Future<MealDescription> getMealDescription(String idMeal);
}

class MealDataSourceImpl implements MealDataSource {
  final http.Client client;

  MealDataSourceImpl(this.client);

  @override
  Future<List<Meal>> getMealDataSource(String meal) async {
    final result = await client.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/search.php?s=$meal'));

    if (result.statusCode != 200) {
      throw Exception('No se pudo completar la petición');
    }

    final response = jsonDecode(result.body);

    return ((response['meals'] ?? []) as List)
        .map((e) => MealModel.fromJson(e))
        .toList();
  }

  @override
  Future<MealDescription> getMealDescription(String idMeal) async {
    final result = await client.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$idMeal'));

    if (result.statusCode != 200) {
      throw Exception('No se pudo completar la petición');
    }

    final response = jsonDecode(result.body);

    return MealDescriptionModel.fromJson((response['meals'] as List).first);
  }
}
