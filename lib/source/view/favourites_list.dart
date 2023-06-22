import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_of_items_demo/source/cubit/item_cubit.dart';
import 'package:list_of_items_demo/source/view/item_screen.dart';

class FavouriteList extends StatelessWidget {
  const FavouriteList({super.key});

  @override
  Widget build(BuildContext context) {
    var listViewCubit = context.read<ItemCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Text(
          "Favourite List",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),centerTitle: true,
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
                height: 15,
              ),
              BlocConsumer<ItemCubit, ItemState>(
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
                        itemCount: state.itemList?.length,
                        itemBuilder: (context, index) {
                          return ItemsList(
                            listCubit: listViewCubit,
                            item: state.itemList![index],
                            index: index,
                            isFavouriteList: true,
                          );
                        },
                      ),
                    );
                  } else {
                    return  Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue[700],
                      ),
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
