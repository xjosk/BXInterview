import 'dart:convert';

import 'package:consumo_api_entrevista/features/data/models/meal_model.dart';
import 'package:consumo_api_entrevista/features/domain/entities/meal.dart';
import 'package:http/http.dart' as http;

abstract class MealDataSource {
  Future<List<Meal>> getMealDataSource(String meal);
}

class MealDataSourceImpl implements MealDataSource {
  final http.Client client;

  MealDataSourceImpl(this.client);

  @override
  Future<List<Meal>> getMealDataSource(String meal) async {
    final result = await client
        .get(Uri.parse('www.themealdb.com/api/json/v1/1/search.php?s=$meal'));

    if (result.statusCode != 200) {
      throw Exception('No se pudo completar la petición');
    }

    final response = jsonDecode(result.body);

    return (response as List).map((e) => MealModel.fromJson(e)).toList();
  }
}
