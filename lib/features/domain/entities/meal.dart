import 'package:equatable/equatable.dart';

class Meal extends Equatable {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;
  final String strArea;

  const Meal(
      {required this.idMeal,
      required this.strMeal,
      required this.strMealThumb,
      required this.strArea});

  @override
  List<Object?> get props => [idMeal, strMeal, strMealThumb, strArea];
}
