import 'package:consumo_api_entrevista/features/data/datasource/meal_datasource.dart';
import 'package:consumo_api_entrevista/features/domain/entities/meal.dart';
import 'package:consumo_api_entrevista/features/domain/entities/meal_description.dart';
import 'package:consumo_api_entrevista/features/domain/repositories/meal_repository.dart';

class MealRepositoryImpl implements MealRepository {
  final MealDataSource datasource;

  MealRepositoryImpl(this.datasource);

  @override
  Future<List<Meal>> getConcreteMeal(String name) async {
    return await datasource.getMealDataSource(name);
  }

  @override
  Future<MealDescription> getMealDescription(String idMeal) async {
    return await datasource.getMealDescription(idMeal);
  }
}
