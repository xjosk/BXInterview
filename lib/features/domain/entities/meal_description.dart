import 'package:equatable/equatable.dart';

class MealDescription extends Equatable {
  final String strCategory;
  final String strArea;
  final String strInstruction;

  const MealDescription(
      {required this.strCategory,
      required this.strArea,
      required this.strInstruction});

  @override
  List<Object?> get props => [strCategory, strArea, strInstruction];
}
