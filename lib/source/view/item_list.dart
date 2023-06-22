import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_of_items_demo/source/cubit/item_cubit.dart';
import 'package:list_of_items_demo/source/view/favourites_list.dart';
import 'package:list_of_items_demo/source/view/item_screen.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var listCubit = context.read<ItemCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Text(
          "All Items",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<ItemCubit, ItemState>(
            builder: (context, state) {
              return Padding(
              padding: const EdgeInsets.only(right:5.0,),

                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return BlocProvider(
                          create: (context) =>
                              ItemCubit()..getItemsData(true),
                          child: const FavouriteList(),
                        );
                      })));
                    },
                    icon: Stack(
                      children: [
                        const SizedBox(
                    height: 100,
                    width: 50,
                    ),
                        const Icon(Icons.favorite,size: 40,color: Colors.redAccent,),
                   Positioned(
                    right: 2,
                     child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.white,
                      child: Text("${state.favList?.length ?? 0}", style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16),
                       textAlign: TextAlign.end,)),
                   ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
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
                    color: Colors.white70,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: Colors.black,width: 2),
                  ),
                  child: ListTile(
                    trailing: IconButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        listCubit.getItemsData();
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 28,
                      ),
                    ),
                    title: TextField(
                      onSubmitted: (value) {
                        FocusScope.of(context).unfocus();
                        listCubit.getItemsData();
                      },
                      onChanged: listCubit.searchTextChange,
                      decoration: const InputDecoration(
                    
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          
                        ),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
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
                          return state.itemList?[index] != null ? ItemsList(
                            listCubit: listCubit,
                            item: state.itemList![index],
                            index: index,
                            isFavouriteList: false,
                          ):const SizedBox.shrink();
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
