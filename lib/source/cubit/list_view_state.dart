part of 'list_view_cubit.dart';

class ListViewState {
  final List<Drink>? drinkList;
  final Status? status;
  final String? errorMessage;
  final String? searchTerm;

  ListViewState({
    this.drinkList,
    this.status,
    this.errorMessage,
    this.searchTerm,
  });

  ListViewState copyWith({
    List<Drink>? drinkList,
    Status? status,
    String? errorMessage,
    String? searchTerm,
  }) {
    return ListViewState(
      drinkList: drinkList ?? this.drinkList,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}

enum Status { error, loading, loaded }
