// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mynote2/shared/components/components.dart';
import 'package:mynote2/shared/cubit/cubit.dart';
import 'package:mynote2/shared/cubit/states.dart';

class archivedScreen extends StatelessWidget {
  const archivedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<AppCubit,AppStates>(
          listener:(BuildContext context,AppStates state){},
          builder: (BuildContext context,AppStates state){
            var tasks=AppCubit.get(context).archiveTasks;
            return taskBuilder(tasks: tasks);

          }


      );return Container();
  }
}
