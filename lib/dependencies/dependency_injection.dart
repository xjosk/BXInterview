import 'package:consumo_api_entrevista/features/data/datasource/meal_datasource.dart';
import 'package:consumo_api_entrevista/features/data/repositories/meal_repository_impl.dart';
import 'package:consumo_api_entrevista/features/domain/usecases/get_concrete_meal_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../features/domain/repositories/meal_repository.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerLazySingleton(() => http.Client);
  getIt.registerLazySingleton<MealDataSource>(
      () => MealDataSourceImpl(getIt.call()));
  getIt.registerLazySingleton<MealRepository>(
      () => MealRepositoryImpl(getIt.call()));
  getIt.registerLazySingleton<GetConcreteMeal>(
      () => GetConcreteMeal(getIt.call()));
}
