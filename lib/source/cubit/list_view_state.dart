part of 'list_view_cubit.dart';

class ListViewState {
  final List<Drink>? drinkList;
  final List<Drink?>? favList;
  final Status? status;
  final String? errorMessage;
  final String? searchTerm;
  final bool isFavourite;

  ListViewState({
    this.drinkList,
    this.status,
    this.errorMessage,
    this.searchTerm,
    this.favList,
    this.isFavourite = false,
  });

  ListViewState copyWith({
    List<Drink>? drinkList,
    List<Drink?>? favList,
    Status? status,
    String? errorMessage,
    String? searchTerm,
    bool? isFavourite,
  }) {
    return ListViewState(
      drinkList: drinkList ?? this.drinkList,
      favList: favList ?? this.favList,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      searchTerm: searchTerm ?? this.searchTerm,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}

enum Status { error, loading, loaded }
