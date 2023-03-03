import 'package:consumo_api_entrevista/features/domain/usecases/get_concrete_meal_usecase.dart';
import 'package:consumo_api_entrevista/features/pages/meal_description.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../domain/entities/meal.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  late final GetConcreteMeal getConcreteMeal;
  late final getIt = GetIt.instance;
  List<Meal>? meals;

  void getMeals(String meal) async {
    meals = null;
    setState(() {});
    meals = await getConcreteMeal.getMeal(meal);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getConcreteMeal = getIt.call<GetConcreteMeal>();
    getMeals('');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: getMeals,
          ),
           SizedBox(
                  height: height / 1.5,
                  width: width,
                  child: meals == null
              ? Center(child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator()))
              : ListView.builder(
                      itemCount: meals?.length,
                      itemBuilder: (context, index) {
                        final meal = meals![index];

                        return Card(
                          child: Material(
                            child: InkWell(
                              onTap: () => Navigator.of(context).push(CupertinoModalPopupRoute(builder: (context) => MealDescriptionPage(meal: meal))),
                              child: Padding(
                                padding: const EdgeInsets.all(50.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.network(meal.strMealThumb, scale: 10),
                                    Expanded(child: Center(child: Text(meal.strMeal, textAlign: TextAlign.center,style: TextStyle(fontSize: 20),))),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
        ],
      ),
    );
  }
}
