// ignore_for_file: camel_case_types, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mynote2/shared/components/components.dart';
import 'package:mynote2/shared/cubit/cubit.dart';
import 'package:mynote2/shared/cubit/states.dart';

class doneTasks extends StatelessWidget {
  const doneTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<AppCubit,AppStates>(
          listener:(BuildContext context,AppStates state){},
          builder: (BuildContext context,AppStates state){
            var tasks=AppCubit.get(context).donetasks;
            return taskBuilder(tasks: tasks);

          }


      );
  }
}
