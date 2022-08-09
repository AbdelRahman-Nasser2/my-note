// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mynote2/modules/counter/cubit/cubit.dart';
import 'package:mynote2/modules/counter/cubit/states.dart';



class counterhomeScreen extends StatelessWidget {
  counterhomeScreen({Key? key,}) : super(key: key);


  int count=1;

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
        create: (BuildContext context) =>CounterCubit(),
        child: BlocConsumer<CounterCubit,CounterState>(
          listener: (BuildContext context,CounterState state)
          {
            if(state is CounterPlusState){
              print('plus State ${state.counter}');
            }
            if(state is CounterMinusState){
              print('minus Staten${state.counter}');

            }

          },
          builder: (BuildContext context,CounterState state){
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                title: const Text(
                  "My Note",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                flexibleSpace: Container(
                  foregroundDecoration: BoxDecoration(),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [HexColor('#b5862e'),HexColor("#e1c776")],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topLeft,
                    ),
                  ),
                ),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.max,
                    children: [
                      TextButton(
                        onPressed: ()
                        {
                          CounterCubit.get(context).plus();

                        },
                        child: Text(
                          'plus',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Colors.black
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "${CounterCubit.get(context).counter}",
                        style:TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ) ,
                      ),

                      SizedBox(
                        width: 12,
                      ),


                      TextButton(
                        onPressed: ()
                        {

                          CounterCubit.get(context).minus();

                        },
                        child: Text(
                          'minus',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          ),
        );


  }

}






