import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_flutter_demo/source/cubit/list_view_cubit.dart';
import 'package:rest_api_flutter_demo/source/model/model.dart';
import 'package:rest_api_flutter_demo/source/view/data_detail_view.dart';

class DrinkListItem extends StatelessWidget {
  const DrinkListItem({
    Key? key,
    required this.listViewCubit,
    required this.drink,
    required this.index,
  }) : super(key: key);

  final ListViewCubit listViewCubit;
  final Drink drink;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) {
              return DataDetailView(
                drink: drink,
              );
            }),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            color: Colors.black,
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Drink: ${drink.strDrink ?? ""}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              BlocBuilder<ListViewCubit, ListViewState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      listViewCubit.setFavouriteState(drink, index);
                    },
                    icon: (state.favList ?? []).contains(drink)
                    //  drink.strDrink
                        ? const Icon(
                            Icons.favorite,
                            size: 35,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            size: 35,
                          ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
