import 'package:consumo_api_entrevista/features/domain/usecases/get_concrete_meal_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  late final GetConcreteMeal getConcreteMeal;
  late final getIt = GetIt.instance;

  @override
  void initState() {
    super.initState();

    getConcreteMeal = getIt.call<GetConcreteMeal>();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [],
      ),
    );
  }
}
