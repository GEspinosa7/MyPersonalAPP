// import 'package:flutter/material.dart';

// import 'searchTrainer.dart';

// final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

// class SearchStep extends StatefulWidget {
//   @override
//   _SearchStepPageState createState() => _SearchStepPageState();
// }

// class _SearchStepPageState extends State<SearchStep> {
//   @override

//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Center(
//           child: TimeToSearch(),
//         ),
//       ),
//     );
//   }
// }

// class TimeToSearch extends StatelessWidget {
//   @override

//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           margin: EdgeInsets.all(20.0),
//           height: 80,
//           width: double.infinity,
//           child: Text("Agora está na hora de procurar seu personal trainer", style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center),
//         ),
//         FlatButton(
//           color: Colors.green,
//           textColor: Colors.white,
//           padding: EdgeInsets.all(10.0),
//           child: Text("Procurar",style: TextStyle(fontSize: 20.0),),
//           onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) {return ListTrainer();}))
//         ),
//       ],
//     );
//   }
// }
