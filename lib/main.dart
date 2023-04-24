import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rest_api_flutter_demo/repository/repository.dart';
import 'package:rest_api_flutter_demo/source/model/drink_model.dart';
import 'package:rest_api_flutter_demo/source/view/data_list_view.dart';

import 'source/cubit/list_view_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('drinks');
  // Hive.registerAdapter(DrinkModelAdapter());
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
