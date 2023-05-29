import 'package:consumo_api_entrevista/features/data/datasource/meal_datasource.dart';
import 'package:consumo_api_entrevista/features/data/repositories/meal_repository_impl.dart';
import 'package:consumo_api_entrevista/features/domain/usecases/get_concrete_meal_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';
import '../features/domain/repositories/meal_repository.dart';

late Provider<GetConcreteMeal> getConcreteMeal;

init() {
  final httpClient = Provider<http.Client>(
    (ref) => http.Client(),
  );
  final mealDataSource = Provider<MealDataSource>(
    (ref) => MealDataSourceImpl(ref.read(httpClient)),
  );
  final mealRepository = Provider<MealRepository>(
    (ref) => MealRepositoryImpl(ref.read(mealDataSource)),
  );
  getConcreteMeal = Provider<GetConcreteMeal>(
    (ref) => GetConcreteMeal(ref.read(mealRepository)),
  );
}
