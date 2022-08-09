// //
// // import 'package:flutter/material.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// //
// // class test extends StatelessWidget {
// //    test({Key? key}) : super(key: key);
// //
// //
// //   List<Widget> item=
// //   [
// //     IconButton(
// //         onPressed: (){},
// //         icon: Icon(Icons.check_box)),
// //     IconButton(
// //       onPressed: (){},
// //       icon: FaIcon(FontAwesomeIcons.boxArchive),
// //     ),
// //   ];
// //   Widget fab=Column();
// //
// //   List<String> items=["Item1","Item2"];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return
// //       Expanded(
// //       child: DropdownButton<Widget>(
// //           icon: Icon(Icons.keyboard_arrow_down_outlined),
// //           // value:selectItem ,
// //           items: item?.map((items) => DropdownMenuItem<Widget>(
// //
// //               child: items)).toList(),
// //           onChanged: (items){}
// //       ),
// //     );
// //   }
// // }
//
//
//
//
//
//
//
//
//
// import 'package:flutter/material.dart';
//
//
// enum _MenuValues {
//   page2,
//   settings,
//   chickens,
// }
//
// class MyApp extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       onGenerateTitle: (c) => '🤔',
//       darkTheme: ThemeData.dark(),
//       title: '🤔',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Home(),
//     );
//   }
// }
//
// class Home extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     checkOnTheChickens() {
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('all the chickens are in the coop')));
//     }
//
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: PopupMenuButton<_MenuValues>(
//           itemBuilder: (BuildContext context) => [
//             PopupMenuItem(
//               child: Text('Settings'),
//               value: _MenuValues.settings,
//             ),
//             PopupMenuItem(
//               child: Text('Page2'),
//               value: _MenuValues.page2,
//             ),
//             PopupMenuItem(
//               child: Text('Check on the chickens'),
//               value: _MenuValues.chickens,
//             ),
//           ],
//           // onSelected: (value) {
//           //   switch (value) {
//           //     case _MenuValues.page2:
//           //       Navigator.of(context)
//           //           .push(MaterialPageRoute(builder: (c) => SecondPage()));
//           //       break;
//           //     case _MenuValues.settings:
//           //       Navigator.of(context)
//           //           .push(MaterialPageRoute(builder: (c) => SettingsPage()));
//           //       break;
//           //     case _MenuValues.chickens:
//           //       checkOnTheChickens();
//           //       break;
//           //   }
//           // },
//         ),
//       ),
//     );
//   }
// }
//
// class SecondPage extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Text('the 2nd page'),
//       ),
//     );
//   }
// }
//
// class SettingsPage extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Text('settings page'),
//       ),
//     );
//   }
// }