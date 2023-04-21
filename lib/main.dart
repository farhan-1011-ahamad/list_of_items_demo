import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_flutter_demo/repository/repository.dart';
import 'package:rest_api_flutter_demo/source/view/data_list_view.dart';

import 'source/cubit/list_view_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DataRepository(),
      child: MaterialApp(
        title: 'Rest API Call',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => ListViewCubit()..getDrinkResponseFromRepo(),
          child: const DataListView(),
        ),
      ),
    );
  }
}
