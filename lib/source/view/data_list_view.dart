import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_flutter_demo/source/cubit/list_view_cubit.dart';
import 'package:rest_api_flutter_demo/source/view/drink_data_list_item.dart';

class DataListView extends StatelessWidget {
  const DataListView({super.key});

  @override
  Widget build(BuildContext context) {
    var listViewCubit = context.read<ListViewCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: const Text(
          "Data List View",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: Colors.black),
                  ),
                  child: ListTile(
                    trailing: IconButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        listViewCubit.getDrinkResponseFromRepo();
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    title: TextField(
                      onSubmitted: (value) {
                        FocusScope.of(context).unfocus();
                        listViewCubit.getDrinkResponseFromRepo();
                      },
                      onChanged: listViewCubit.searchTermChange,
                      decoration: const InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              BlocConsumer<ListViewCubit, ListViewState>(
                listener: (context, state) {
                  if (state.status == Status.error) {
                    var snackBar = SnackBar(
                      content: Text(
                        state.errorMessage ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.red,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                builder: (context, state) {
                  if (state.status == Status.loaded) {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.drinkList?.length,
                        itemBuilder: (context, index) {
                          return DrinkListItem(
                            listViewCubit: listViewCubit,
                            drink: state.drinkList![index],
                            index: index,
                          );
                        },
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator(
                      color: Colors.amber,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
