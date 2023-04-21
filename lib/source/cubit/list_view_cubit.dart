import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_flutter_demo/repository/repository.dart';
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
    } catch (e) {
      log("$e", name: "Error while fetching list in List Cubit");
      emit(state.copyWith(status: Status.error, errorMessage: "$e"));
      emit(state.copyWith(status: Status.loaded));
    }
  }

  void searchTermChange(String? searchTerm) {
    emit(state.copyWith(searchTerm: searchTerm));
    if (searchTerm != null) {
      if (searchTerm.isNotEmpty &&
          searchTerm.length < 5) {
        getDrinkResponseFromRepo();
      }
    }
  }
  //
}
