import 'package:flutter/material.dart';
import 'package:rest_api_flutter_demo/source/model/model.dart';

class DataDetailView extends StatelessWidget {
  const DataDetailView({
    required this.drink,
    super.key,
  });

  final Drink drink;

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            drink.strDrinkThumb != null && drink.strDrinkThumb!.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(
                      fit: BoxFit.fill,
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
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Drink: ${drink.strDrink ?? ""}",
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink: ${drink.strDrink ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Alcoholic Status: ${drink.strAlcoholic ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Category: ${drink.strCategory ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Glass: ${drink.strGlass ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Instructions: ${drink.strInstructions ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Instructions in German: ${drink.strInstructionsDE ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Instructions in Spanish: ${drink.strInstructionsES ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Instructions in French: ${drink.strInstructionsFR ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Instructions in Italy: ${drink.strInstructionsIT ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Ingredient 1: ${drink.strIngredient1 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Ingredient 2: ${drink.strIngredient2 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Ingredient 3: ${drink.strIngredient3 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Ingredient 4: ${drink.strIngredient4 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Ingredient 5: ${drink.strIngredient5 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Ingredient 6: ${drink.strIngredient6 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Ingredient 7: ${drink.strIngredient7 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Ingredient 8: ${drink.strIngredient8 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Ingredient 9: ${drink.strIngredient9 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Ingredient 10: ${drink.strIngredient10 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Ingredient 11: ${drink.strIngredient11 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Ingredient 12: ${drink.strIngredient12 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Ingredient 13: ${drink.strIngredient13 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Ingredient 14: ${drink.strIngredient14 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Ingredient 15: ${drink.strIngredient15 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Measure 1: ${drink.strMeasure1 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Measure 2: ${drink.strMeasure2 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Measure 3: ${drink.strMeasure3 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Measure 4: ${drink.strMeasure4 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Measure 5: ${drink.strMeasure5 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Measure 6: ${drink.strMeasure6 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Measure 7: ${drink.strMeasure7 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Measure 8: ${drink.strMeasure8 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Measure 9: ${drink.strMeasure9 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Measure 10: ${drink.strMeasure10 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Measure 11: ${drink.strMeasure11 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Measure 12: ${drink.strMeasure12 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Measure 13: ${drink.strMeasure13 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Measure 14: ${drink.strMeasure14 ?? ""}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Drink Measure 15: ${drink.strMeasure15 ?? ""}",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
            "strInstructionsZH-HANS": null,
            "strInstructionsZH-HANT": null,
            "strDrinkThumb": "https://www.thecocktaildb.com/images/media/drink/vr6kle1504886114.jpg",
            "strImageSource": null,
            "strImageAttribution": null,
            "strCreativeCommonsConfirmed": "No",
            "dateModified": "2017-09-08 16:55:14"
            */