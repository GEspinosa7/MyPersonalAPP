// import 'package:flutter/material.dart';

// import 'trainerProfileA.dart';
// final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

// class CancelServices extends StatefulWidget {
//   @override
//   _CancelServicesState createState() => _CancelServicesState();
// }

// class _CancelServicesState extends State<CancelServices> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//             theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
//             debugShowCheckedModeBanner: false,
//             home: Scaffold(
//               appBar: AppBar(
//                 title: Text('Cancelar Serviços', textAlign: TextAlign.center, style: TextStyle(color: Colors.red),),
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
//               body:
//                  cancelServices()
              
//             )
//     );
//   }

//   Widget cancelServices(){
//     final _formKey = GlobalKey<FormState>();

//     return 
//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             margin: EdgeInsets.all(20),
//             height: 100,
//             width: double.infinity,
//             decoration:
//               BoxDecoration(
//                 border: Border.all(color: Colors.red),
//                 borderRadius: const BorderRadius.all(const Radius.circular(10)),
//               ), 
//             child: 
//               Center(
//                 child:
//                   Padding(
//                     padding: EdgeInsets.all(10),
//                     child: 
//                     Text('Atenção! Você está prestes as cancelar os serviços do personal {personal_name}',
//                       textAlign: TextAlign.justify,
//                       style: TextStyle(fontSize: 20),
//                     )
//                   )
//               )
//           ),
//           Form(
//             key: _formKey,
//             child: 
//             Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(10),
//                   child: 
//                     TextFormField(
//                       maxLines: 5,
//                       textAlign: TextAlign.center,
//                       decoration: const InputDecoration(hintText: 'Diga o motivo do cancelamento...'),
//                       validator: (value) {
//                         if (value.isEmpty) {
//                           return 'Por favor, seu personal precisa saber o motivo de sua decisão';
//                         }
//                         return null;
//                       }
//                     ),
//                 ),
//                 FlatButton(
//                   color: Colors.black45,
//                     textColor: Colors.red,
//                       padding: EdgeInsets.all(10.0),
//                       onPressed: () {
//                         if (_formKey.currentState.validate()) {
//                           /**/
//                         }
//                       },
//                       child: Text("Finalizar Cancelamento", style: TextStyle(fontSize: 20.0))
//                 )
//               ]
//             )
//           ),
//         ],
//       );
//   }
// }