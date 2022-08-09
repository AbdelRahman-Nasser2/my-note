// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mynote2/shared/bloc_observer.dart';

import 'layout/homeLayoutScreen.dart';

void main() {
  BlocOverrides.runZoned(
          () {

          },
git add
    blocObserver: MyBlocObserver()
  );
  runApp( MyApp());
}

enum  MenuValues {
  archivetask,
  dontask,
  deletetask,

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: homeLayoutScreen(),

      );
  }

}
