// import 'package:MyPersonal/static_pages/trainerAvaliations.dart';
// import 'package:MyPersonal/static_pages/trainerProfileA.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart'; 
// import 'package:flutter/material.dart';

// final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

// class AvaliationArea extends StatefulWidget {
//   @override
//   _AvaliationAreaState createState() => _AvaliationAreaState();
// }

// class _AvaliationAreaState extends State<AvaliationArea> {
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//             theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
//             debugShowCheckedModeBanner: false,
//             home: Scaffold(
//               appBar: AppBar(
//                 title: Text('Área de Avaliação', textAlign: TextAlign.center),
//                 centerTitle: true,
//                 backgroundColor: Colors.transparent,
//                 actions: <Widget>[
//                   IconButton(
//                     icon: Icon(Icons.arrow_back),
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) { return TrainerAProfile();}));
//                     },
//                   )
//                 ],
//               ),
//               body: avaliationArea() 
            
//             )
//     );
//   }

//   Widget avaliationArea(){
//     final _formKey = GlobalKey<FormState>();
//     var rating = 0.0;

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text('Dê sua nota'),
//         Container(
//           width: double.infinity,
//           margin: EdgeInsets.all(10),
//           child: 
//             Center(
//               child:
//                 SmoothStarRating(
//                   allowHalfRating: false,
//                   onRated: (v) {
//                   },
//                   starCount: 5,
//                   rating: rating,
//                   size: 40.0,
//                   defaultIconData: Icons.star_border,
//                   filledIconData: Icons.star,
//                   color: Colors.yellow,
//                   borderColor: Colors.yellow,
//                   spacing: 2.0
//                 )
//             )

//         ),

//         Padding(
//           padding: EdgeInsets.all(10),
//           child:
//             Form(
//               key: _formKey,
//               child: 
//                 Column(
//                   children: [
//                     TextFormField(
//                       decoration: const InputDecoration(hintText: 'Breve comentário, ex: "Excelente profissional"'),
//                       validator: (value) {
//                         if (value.isEmpty) {
//                           return 'Por favor, digite algo';
//                         }
//                         return null;
//                       }
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(top: 50, bottom: 20),
//                       decoration:
//                         BoxDecoration(
//                               border: Border.all(color: Colors.green),
//                               borderRadius: const BorderRadius.all(const Radius.circular(10)),
//                         ), 
//                       child: 
//                         Padding(
//                           padding: EdgeInsets.all(10),
//                           child: 
//                         TextFormField(
//                           maxLines: 5,
//                           textAlign: TextAlign.center,
//                           decoration: const InputDecoration(hintText: 'Avaliação Completa'),
//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return 'Por favor, pelo menos uma frase';
//                             }
//                             return null;
//                           }
//                         ),
//                         )

//                     ),

//                     FlatButton(
//                       color: Colors.green,
//                         textColor: Colors.white,
//                           padding: EdgeInsets.all(10.0),
//                           onPressed: () {
//                             if (_formKey.currentState.validate()) {
//                                Navigator.push(context, MaterialPageRoute(builder: (context) { return AllAvaliations();}));
//                             }
//                           },
//                           child: Text("Avaliar", style: TextStyle(fontSize: 20.0))
//                     )
//                   ],
//                 )
//             )
//         )
//       ],
//     );

//   }
// }