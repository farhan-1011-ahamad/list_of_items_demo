import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_of_items_demo/model/item.dart';
import 'package:list_of_items_demo/source/cubit/item_cubit.dart';
import 'package:list_of_items_demo/source/view/item_detail.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({
    Key? key,
    required this.listCubit,
    required this.item,
    required this.index,
    required this.isFavouriteList,
  }) : super(key: key);

  final ItemCubit listCubit;
  final Item item;
  final int index;
  final bool isFavouriteList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) {
              return ItemDetail(
                item: item,
              );
            }),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                
                item.strItemThumb != null && item.strItemThumb!.isNotEmpty
                  ? Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      // margin: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Image.network(
                          fit: BoxFit.fitHeight,
                          item.strItemThumb!,
                          height: 60,
                          width: 60,
                          cacheHeight: 60,
                          cacheWidth: 60,
                          loadingBuilder: (context, child, loadingProgress) {
                            return loadingProgress == null
                                ? child
                                : Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                          },
                        ),
                      ),
                    )
                  : const SizedBox(),
                  const SizedBox(width: 10,),
              Text(
                item.strItem ?? "",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),],),
              if (!isFavouriteList) ...[
                BlocBuilder<ItemCubit, ItemState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        listCubit.saveLocalList(item, index);
                      },
                      icon: (state.favList ?? []).contains(item)
                          ? const Icon(
                              Icons.favorite,
                              size: 35,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              size: 35,
                            ),
                    );
                  },
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
