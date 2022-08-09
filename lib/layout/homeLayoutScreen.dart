// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, avoid_print, file_names, must_call_super
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import 'package:mynote2/shared/cubit/cubit.dart';
import 'package:mynote2/shared/cubit/states.dart';

import 'package:sqflite/sqflite.dart';

import '../shared/components/components.dart';


// ignore: camel_case_types
class homeLayoutScreen extends StatelessWidget  {






  var scaffoldKey=GlobalKey<ScaffoldState>();
  var formKey=GlobalKey<FormState>();


  //Var DataBase
  Database? database;
  var titlecontroller=TextEditingController();
  var datecontroller=TextEditingController();
  var timecontroller=TextEditingController();
  var notecontroller=TextEditingController();

  homeLayoutScreen({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..createDataBase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener:(BuildContext context,AppStates state)
        {
          if(state is AppInsertDatabaseState)
          {
            Navigator.pop(context);
          }
        } ,
        builder: (BuildContext context,AppStates state)
          {
            AppCubit cubit=AppCubit.get(context);
            return Scaffold(
              key: scaffoldKey,
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
              //tasks.length==0 ? Center(child: CircularProgressIndicator()) :
              body:ConditionalBuilder(
                  condition: state is!AppGetDatabaseLoadingState,
                  builder: (context)=>cubit.screens[cubit.currentindex],
                  fallback: (context)=>Center(
                      child: CircularProgressIndicator()
                  ),
              ),
              bottomNavigationBar: CurvedNavigationBar(

                key: cubit.navigation,
                index:  AppCubit.get(context).currentindex ,
                onTap: (index){
                  cubit.bottomNav(index);
                  // setState(() {
                  //   _index=index;
                  // });
                },
                backgroundColor: Colors.white.withOpacity(0),
                buttonBackgroundColor:HexColor('#b5862e'),
                color: Colors.grey,
                height: 50.0,

                // animationCurve: Curves.easeInCirc,
                items: <Widget>[
                  Icon(Icons.task_alt_outlined, size: 30,color: Colors.white,),
                  Icon(Icons.home, size: 30,semanticLabel: 'Home',color: Colors.white,),
                  Icon(Icons.archive_outlined, size: 30, color: Colors.white,),
                ],

              ),
              floatingActionButton: FloatingActionButton(
                onPressed:  () {

                  //Closed BotttomSheet

                  if(cubit.isBottomSheetShown)
                  {if(formKey.currentState!.validate())
                  {
                    cubit.insertDataBase(
                        title: titlecontroller.text,
                        time: timecontroller.text,
                        date: datecontroller.text,
                        note: notecontroller.text);

                    // insertDataBase(
                    //   title: titlecontroller.text,
                    //   time: timecontroller.text,
                    //   date: datecontroller.text,
                    //   note: notecontroller.text,
                    // ).then((value)
                    // {
                    //   Navigator.pop(context);
                      // getDataFromDataBase(database).then((value)
                      // {
                      //
                      //   isBottomSheetShown=false;
                        // setState(()
                        // {
                        //   fabicon=Icons.edit;
                        // });
                      // });

                    // });

                  }
                  }else

                    //open bottomsheet
                      {
                    scaffoldKey.currentState?.showBottomSheet((context) =>
                        Container(

                          padding: EdgeInsets.all(20),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //title
                                text(
                                    onTap: ()
                                    {
                                      print("title taped");
                                    },
                                    validate: (value)
                                    {
                                      if(value!.isEmpty)
                                      {
                                        return"Task tittle must not be empty";
                                      }
                                      return null;
                                    },
                                    controller: titlecontroller,
                                    input: TextInputType.text,
                                    hint: "Task title",
                                    label: "Task title",
                                    prifix:Icons.title
                                ),
                                SizedBox(
                                  height: 20,
                                ),


                                // note
                                text(
                                    onTap: ()
                                    {
                                      print("note taped");
                                    },

                                    controller: notecontroller,
                                    input: TextInputType.text,
                                    hint: "Note title",
                                    label: "Note title",
                                    prifix:Icons.edit_note_outlined
                                ),
                                SizedBox(
                                  height: 20,
                                ),


                                //Time
                                text(
                                    onTap: ()
                                    {
                                      showTimePicker(
                                        context: context,

                                        initialTime: TimeOfDay.now(),
                                      ).then((value)
                                      {
                                        timecontroller.text =value!.format(context).toString();
                                        print(value.toString());
                                      });
                                    },
                                    validate: (value)
                                    {
                                      if(value!.isEmpty)
                                      {
                                        return"Task time must not be empty";
                                      }
                                      return null;
                                    },
                                    controller: timecontroller,
                                    input: TextInputType.datetime,
                                    hint: "Time title",
                                    label: "Time title",
                                    prifix:Icons.watch_later_rounded
                                ),

                                SizedBox(
                                  height: 20,
                                ),




                                //Date
                                text(
                                  onTap: ()
                                  {
                                    showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2030-12-31')
                                    ).then((value)
                                    {
                                      datecontroller.text =DateFormat.yMMMEd().format(value!);

                                    });
// showDateRangePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.parse('2030-12-31'));
                                  },
                                  validate: (value)
                                  {
                                    if(value!.isEmpty)
                                    {
                                      return"Task date must not be empty";
                                    }
                                    return null;
                                  },
                                  controller: datecontroller,
                                  input: TextInputType.datetime,
                                  hint: "Date title",
                                  label: "Date title",
                                  prifix:Icons.calendar_today_rounded,
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      elevation: 20,
                    ).closed.then((value)
                    {
                      cubit.fabshown(
                          isShown: false,
                          fab: Icons.edit);
                    });

                    cubit.fabshown(
                        isShown: true,
                        fab: Icons.add);

                  }
                },
                child: Icon (
                  cubit.fabicon,
                  color: Colors.white,
                ),
                hoverColor: Colors.blueGrey,
                backgroundColor: HexColor('#b5862e'),
                splashColor: Colors.white,
                autofocus: true,
              ),
            );
          }

      ),
    );
  }










}


