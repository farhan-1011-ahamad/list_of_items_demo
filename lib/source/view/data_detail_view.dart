import 'package:flutter/material.dart';
import 'package:rest_api_flutter_demo/source/model/model.dart';
import 'package:rest_api_flutter_demo/source/view/drink_data_text.dart';

class DataDetailView extends StatelessWidget {
  const DataDetailView({
    required this.drink,
    super.key,
  });

  final Drink drink;

  @override
  Widget build(BuildContext context) {
    List drinkIngredientsList = [
      drink.strIngredient1,
      drink.strIngredient2,
      drink.strIngredient3,
      drink.strIngredient4,
      drink.strIngredient5,
      drink.strIngredient6,
      drink.strIngredient7,
      drink.strIngredient8,
      drink.strIngredient9,
      drink.strIngredient10,
      drink.strIngredient11,
      drink.strIngredient12,
      drink.strIngredient13,
      drink.strIngredient14,
      drink.strIngredient15,
    ];
    List drinkMeasureList = [
      drink.strMeasure1,
      drink.strMeasure2,
      drink.strMeasure3,
      drink.strMeasure4,
      drink.strMeasure5,
      drink.strMeasure6,
      drink.strMeasure7,
      drink.strMeasure8,
      drink.strMeasure9,
      drink.strMeasure10,
      drink.strMeasure11,
      drink.strMeasure12,
      drink.strMeasure13,
      drink.strMeasure14,
      drink.strMeasure15,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: const Text(
          "Data Detail View",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          drink.strDrinkThumb != null && drink.strDrinkThumb!.isNotEmpty
              ? Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.all(10.0),
                  child: Image.network(
                    fit: BoxFit.fitHeight,
                    drink.strDrinkThumb!,
                    height: 100,
                    width: 100,
                    cacheHeight: 100,
                    cacheWidth: 100,
                    loadingBuilder: (context, child, loadingProgress) {
                      return loadingProgress == null
                          ? child
                          : Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                    },
                  ),
                )
              : const SizedBox(),
          DrinkDataTextComponent(
              title: "Drink Name", drinkText: drink.strDrink),
          DrinkDataTextComponent(
              title: "Drink Type", drinkText: drink.strAlcoholic),
          DrinkDataTextComponent(
              title: "Drink Category", drinkText: drink.strCategory),
          DrinkDataTextComponent(
              title: "Glass for Drink", drinkText: drink.strGlass),
          DrinkDataTextComponent(
              title: "Instructions to use", drinkText: drink.strInstructions),
          DrinkDataTextComponent(
              title: "Instructions to use in German",
              drinkText: drink.strInstructionsDE),
          DrinkDataTextComponent(
              title: "Instructions to use in Spanish",
              drinkText: drink.strInstructionsES),
          DrinkDataTextComponent(
              title: "Instructions to use in French",
              drinkText: drink.strInstructionsFR),
          DrinkDataTextComponent(
              title: "Instructions to use in Italian",
              drinkText: drink.strInstructionsFR),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 15,
            itemBuilder: (context, index) {
              return DrinkDataTextComponent(
                  title: "Drink Ingredient ${index + 1}",
                  drinkText: drinkIngredientsList[index]);
            },
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 15,
            itemBuilder: (context, index) {
              return DrinkDataTextComponent(
                  title: "Drink Measure ${index + 1}",
                  drinkText: drinkMeasureList[index]);
            },
          ),
        ],
      ),
    );
  }
}
