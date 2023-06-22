import 'package:flutter/material.dart';
import 'package:list_of_items_demo/model/item.dart';
import 'package:list_of_items_demo/source/view/item_text.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({
    required this.item,
    super.key,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    List drinkIngredientsList = [
      item.strIngredient1,
      item.strIngredient2,
      item.strIngredient3,
      item.strIngredient4,
      item.strIngredient5,
      item.strIngredient6,
      item.strIngredient7,
      item.strIngredient8,
      item.strIngredient9,
      item.strIngredient10,
      item.strIngredient11,
      item.strIngredient12,
      item.strIngredient13,
      item.strIngredient14,
      item.strIngredient15,
    ];
    List drinkMeasureList = [
      item.strMeasure1,
      item.strMeasure2,
      item.strMeasure3,
      item.strMeasure4,
      item.strMeasure5,
      item.strMeasure6,
      item.strMeasure7,
      item.strMeasure8,
      item.strMeasure9,
      item.strMeasure10,
      item.strMeasure11,
      item.strMeasure12,
      item.strMeasure13,
      item.strMeasure14,
      item.strMeasure15,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue.shade700,
        title: const Text(
          "Data Detail View",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          item.strItemThumb != null && item.strItemThumb!.isNotEmpty
              ? Container(
                
                  alignment: Alignment.centerLeft,
                  // margin: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Image.network(
                      fit: BoxFit.cover,
                      item.strItemThumb!,
                      height: 300,
                      width: double.infinity,
                      cacheHeight: 100,
                      cacheWidth: 100,
                      loadingBuilder: (context, child, loadingProgress) {
                        return loadingProgress == null
                            ? child
                            : Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
                )
              : const SizedBox(),
          ItemElement(
              title: "Item Name", itemText: item.strItem),
          ItemElement(
              title: "Item Type", itemText: item.strAlcoholic),
          ItemElement(
              title: "Item Category", itemText: item.strCategory),
          ItemElement(
              title: "Item for Drink", itemText: item.strGlass),
          ItemElement(
              title: "Instructions", itemText: item.strInstructions),
          ItemElement(
              title: "German",
              itemText: item.strInstructionsDE),
          ItemElement(
              title: "Spanish",
              itemText: item.strInstructionsES),
          ItemElement(
              title: "French",
              itemText: item.strInstructionsFR),
          ItemElement(
              title: "Italian",
              itemText: item.strInstructionsFR),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 15,
            itemBuilder: (context, index) {
              return ItemElement(
                  title: "Ingredient ${index + 1}",
                  itemText: drinkIngredientsList[index]);
            },
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 15,
            itemBuilder: (context, index) {
              return ItemElement(
                  title: "Measure ${index + 1}",
                  itemText: drinkMeasureList[index]);
            },
          ),
        ],
      ),
    );
  }
}
