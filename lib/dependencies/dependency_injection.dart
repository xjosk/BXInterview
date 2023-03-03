import 'package:consumo_api_entrevista/features/data/datasource/meal_datasource.dart';
import 'package:consumo_api_entrevista/features/data/repositories/meal_repository_impl.dart';
import 'package:consumo_api_entrevista/features/domain/usecases/get_concrete_meal_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../features/domain/repositories/meal_repository.dart';

final sl = GetIt.instance;

void setUp() {
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<MealDataSource>(
      () => MealDataSourceImpl(sl()));
  sl.registerLazySingleton<MealRepository>(
      () => MealRepositoryImpl(sl()));
  sl.registerLazySingleton<GetConcreteMeal>(
      () => GetConcreteMeal(sl()));
}
