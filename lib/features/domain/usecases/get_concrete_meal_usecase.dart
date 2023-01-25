import 'package:consumo_api_entrevista/features/domain/repositories/meal_repository.dart';

import '../entities/meal.dart';

class GetConcreteMeal {
  final MealRepository repository;

  GetConcreteMeal(this.repository);

  Future<List<Meal>> getMeal(String meal) async {
    return await repository.getConcreteMeal(meal);
  }
}
