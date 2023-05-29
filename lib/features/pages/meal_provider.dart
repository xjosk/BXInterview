import 'package:riverpod/riverpod.dart';

import '../domain/entities/meal.dart';

class Meals extends StateNotifier<List<Meal>> {
  Meals() : super(const []);

  void replace(List<Meal> meals) {
    state = meals;
  }

  List<Meal> get currentState => state;
}

final meals = StateNotifierProvider<Meals, List<Meal>>((ref) => Meals());
