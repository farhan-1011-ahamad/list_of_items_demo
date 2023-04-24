import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:rest_api_flutter_demo/repository/repository.dart';
import 'package:rest_api_flutter_demo/source/model/drink_model.dart';
import 'package:rest_api_flutter_demo/source/model/model.dart';

part 'list_view_state.dart';

class ListViewCubit extends Cubit<ListViewState> {
  ListViewCubit() : super(ListViewState());

  getDrinkResponseFromRepo() async {
    try {
      emit(state.copyWith(status: Status.loading));
      DrinkResponse drinkResponse =
          await DataRepository().getDrinkResponse(state.searchTerm);
      emit(state.copyWith(
          status: Status.loaded, drinkList: drinkResponse.drinkList));
      loadDrinks();
    } catch (e) {
      log("$e", name: "Error while fetching list in List Cubit");
      emit(state.copyWith(status: Status.error, errorMessage: "$e"));
      emit(state.copyWith(status: Status.loaded));
    }
  }

  void setFavouriteState(Drink drink, int index) async {
    drink.isFavourite = !drink.isFavourite;
    final drinksBox = Hive.box('drinks');
    DrinkModel drinkModel = DrinkModel(
      name: drink.strDrink ?? "",
      isFavourite: drink.isFavourite,
    );

    if (drink.isFavourite) {
      //For marking as favourite
      drinksBox.put(drinkModel.name, drink.strDrink);
      log(drinkModel.name.toString(), name: "Fav Drink");
    } else if (!drink.isFavourite) {
      log(drinkModel.name.toString(), name: "UnFav Drink");
      //For marking as unfavourite
      drinksBox.delete(drinkModel.name);
    }
    emit(state.copyWith(isFavourite: drink.isFavourite));
    loadDrinks();
  }

  void loadDrinks() async {
    final favouriteDrinks = Hive.box('drinks');

    List favouriteDrinksList = favouriteDrinks.values.toList();
    log(favouriteDrinksList.toString(), name: "Favourite Drink List");

    for (var element in favouriteDrinksList) {
      log(element.toString(), name: "favDrink");
    }

    List? finalList = state.drinkList
        ?.where((element) => favouriteDrinksList.contains(element.strDrink))
        .toList();

    log(finalList.toString(), name: "Fav Final list");

    if (finalList != null) {
      emit(state.copyWith(favList: (finalList) as List<Drink>));
    }
  }

  void searchTermChange(String? searchTerm) {
    emit(state.copyWith(searchTerm: searchTerm));
    if (searchTerm != null) {
      if (searchTerm.isNotEmpty && searchTerm.length < 5) {
        getDrinkResponseFromRepo();
      }
    }
  }
  //
}
