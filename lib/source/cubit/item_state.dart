part of 'item_cubit.dart';

class ItemState {
  final List<Item>? itemList;
  final List<Item?>? favList;
  final Status? status;
  final String? errorMessage;
  final String? searchText;
  final bool isFavourite;

  ItemState({
    this.itemList,
    this.status,
    this.errorMessage,
    this.searchText,
    this.favList,
    this.isFavourite = false,
  });

  ItemState copyWith({
    List<Item>? itemList,
    List<Item?>? favList,
    Status? status,
    String? errorMessage,
    String? searchText,
    bool? isFavourite,
  }) {
    return ItemState(
      itemList: itemList ?? this.itemList,
      favList: favList ?? this.favList,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      searchText: searchText ?? this.searchText,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}

enum Status { error, loading, loaded }
