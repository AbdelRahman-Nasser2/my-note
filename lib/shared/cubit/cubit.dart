// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynote2/modules/doneTasks/doneTasks.dart';
import 'package:mynote2/modules/home/homeScreen.dart';
import 'package:mynote2/modules/settings/archivedTasks.dart';
import 'package:mynote2/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit(): super(AppInitialState());


  static AppCubit get(context)=>BlocProvider.of(context);


//part of BottomNavigation Bar
 int currentindex=1;
  var navigation = GlobalKey<CurvedNavigationBarState>();

  List screens = <Widget>[
    doneTasks(),
    homeScreen(),
    archivedScreen(),
  ];


  void bottomNav (int index)
  {
    currentindex= index;
    emit(AppBottomNavBarState());
  }
  
  
  
  
  //DataBase 

  Database? database;
  List<Map> newTasks=[];
  List<Map> donetasks=[];
  List<Map> archiveTasks=[];


//Create DataBase

  void createDataBase (){
     openDatabase(
        'tasks.db',
        version: 1,
        onCreate: (database ,version)

        {

          //id Integer
          //tittle Text
          //date Text
          //time Text
          //status Text
          print('Database created');
          database.execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, note Text, status TEXT)'
          ).then((value)
          => print("table crated")
          ).catchError((error){
            print("Error when creating Table ${error.toString()}");
          });
        },

        onOpen: (database)
        {

          getDataFromDataBase(database);
          print("Database opened ");
         }
    ).then((value)
     {
       database=value;
       emit(AppCreateDatabaseState());
     });
  }



//insert in Data Base

  insertDataBase({
    required String title,
    required String time,
    required String date,
    required String note,
  })async{

    await database?.transaction((txn)
    async {
      txn.rawInsert(
          'INSERT INTO tasks (title, date, time, note, status ) VALUES("$title","$date","$time", "$note","new")'
      ).then((value)
      {
        print("$value inserted ");
        emit(AppInsertDatabaseState());

        getDataFromDataBase(database);
      }).catchError((error)
      {
        print("Error when Inserting new Tasks ${error.toString()}");
      });


      return null;
    });
  }




//Get dataFrom DataBase

  void getDataFromDataBase (database)async{
    emit(AppGetDatabaseLoadingState());
     database!.rawQuery('SELECT * FROM tasks').then((value)
     {
       newTasks=[];
       donetasks=[];
       archiveTasks= [];
       value.forEach((element)
       {
         if(element["status"]=="new")
           newTasks.add(element);
         else if (element["status"]=="done")
           donetasks.add(element);
         else archiveTasks.add(element);

       });
       getDataFromDataBase(database);
       emit(AppGetDatabaseState());
     });

  }




  //UpdateDataBase

  void updatedatabase(
  {
  required String status,
  required int id,
})async
  {
     database?.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]
     ).then((value)
     {
       emit(AppUpdateDatabaseState());
     });
  }



  //Delete Database
  void deletedatedatabase(
      {
        required int id,
      })async
  {
    database?.rawDelete(
        'DELETE FROM tasks WHERE id = ?',
        [id]
    ).then((value)
    {
      emit(AppDeleteDatabaseState());
    });
  }


      // .rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);

  //Fabicon
  IconData fabicon=Icons.edit;
  bool isBottomSheetShown =false;

  void fabshown(
  {
  required bool isShown,
  required IconData fab
}){
    isBottomSheetShown=isShown;
    fabicon= fab;
    emit(AppBottomSheetState());

  }

}