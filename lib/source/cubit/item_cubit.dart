import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:list_of_items_demo/model/item_model.dart';
import 'package:list_of_items_demo/model/item.dart';
import 'package:list_of_items_demo/repository/repository.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(ItemState());

  getItemsData([bool? isFavouriteList]) async {
    try {
      emit(state.copyWith(status: Status.loading));
      ItemResponse itemData =
          await DataRepository().getItems(state.searchText);
      emit(state.copyWith(
          status: Status.loaded, itemList: itemData.drinkList));
      if (isFavouriteList == true) {
        loadFavoriteItem();
      } else {
        itemLoading();
      }
    } catch (e) {
      log("$e", name: "Something went wrong while fetching api");
      emit(state.copyWith(status: Status.error, errorMessage: "$e"));
      emit(state.copyWith(status: Status.loaded));
    }
  }

  void saveLocalList(Item item, int index) async {
    item.isFavourite = !item.isFavourite;
    final _box = Hive.box('items');
    ItemModel itemModel = ItemModel(
      name: item.strItem ?? "",
      isFavourite: item.isFavourite,
    );

    if (item.isFavourite) {
      _box.put(itemModel.name, item.strItem);
      log(itemModel.name.toString(), name: "Fav Drink");
    } else if (!item.isFavourite) {
      log(itemModel.name.toString(), name: "UnFav Drink");
      _box.delete(itemModel.name);
    }
    emit(state.copyWith(isFavourite: item.isFavourite));
    itemLoading();
  }

  void itemLoading() async {
    final favouriteItems = Hive.box('items');

    List favouriteItemsList = favouriteItems.values.toList();
    log(favouriteItemsList.toString(), name: "Favourite Item List");

    for (var element in favouriteItemsList) {
      log(element.toString(), name: "favItem");
    }

    List? finalList = state.itemList
        ?.where((element) => favouriteItemsList.contains(element.strItem))
        .toList();

    log(finalList.toString(), name: "Fav Final list");

    if (finalList != null) {
      emit(state.copyWith(favList: (finalList) as List<Item>));
    }
  }

  void loadFavoriteItem() async {
    final favouriteItems = Hive.box('items');

    List favouriteItemsList = favouriteItems.values.toList();
    log(favouriteItemsList.toString(), name: "Favourite Item List");

    for (var element in favouriteItemsList) {
      log(element.toString(), name: "favItem");
    }

    List? finalList = state.itemList
        ?.where((element) => favouriteItemsList.contains(element.strItem))
        .toList();


    log(finalList.toString(), name: "Fav Final list");

    emit(state.copyWith(itemList: (finalList) as List<Item>));
  }

  void searchTextChange(String? searchText) {
    emit(state.copyWith(searchText: searchText));
    if (searchText != null) {
      if (searchText.isNotEmpty && searchText.length < 5) {
        getItemsData();
      }
    }
  }
}
