// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_print, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mynote2/shared/components/components.dart';
import 'package:mynote2/shared/cubit/cubit.dart';
import 'package:mynote2/shared/cubit/states.dart';


class homeScreen extends StatelessWidget {
    homeScreen({Key? key,}) : super(key: key);


   
    Widget fab=Column();

    List<String> items=["Item1","Item2"];


  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<AppCubit,AppStates>(
          listener:(BuildContext context,AppStates state){},
          builder: (BuildContext context,AppStates state){
            var tasks=AppCubit.get(context).newTasks;
            return taskBuilder(tasks: tasks);

          }


      );
  }

}



