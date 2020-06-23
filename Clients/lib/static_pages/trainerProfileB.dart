// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'contractDef.dart';
// import 'searchTrainer.dart';
// import 'trainerAvaliations.dart';

// final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

// class TrainerBProfile extends StatefulWidget {
//   @override
//   _TrainerBProfileState createState() => _TrainerBProfileState(); 
// }


// class _TrainerBProfileState extends State<TrainerBProfile> { 
//     var trainers = [];

//     @override 
//     void initState(){
//       super.initState();
      
//       Dio().get('http://www.mocky.io/v2/5eb19f5c3200000f4528f891').then((resp) {
        
//         setState(() {
//           trainers = resp.data;
//         });
    
//       });

//     }

//   Widget build(BuildContext context) {
//     return MaterialApp(
//             theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
//             debugShowCheckedModeBanner: false,
//             home: Scaffold(
//               appBar: AppBar(
//                 title: Text('Perfil', textAlign: TextAlign.center),
//                 centerTitle: true,
//                 backgroundColor: Colors.transparent,
//                 actions: <Widget>[
//                   IconButton(
//                     icon: Icon(Icons.arrow_back),
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) { return ListTrainer();}));
//                     },
//                   )
//                 ],
//               ),
//               body: SingleChildScrollView(
//                 child:
//                   trainerProfile() 
//               )
//             )
//     );
//   }

//   Widget trainerProfile() {
//     return Container(
//       margin: EdgeInsets.all(10),
//       child: 
//         Column (
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Row (
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Container(
//                 width: 100,
//                 height: 100,
//                 decoration:
//                   BoxDecoration(
//                     border: Border.all(color: Colors.green),
//                     borderRadius: const BorderRadius.all(const Radius.circular(100)),
//                   ), 
//                 child:
//                   Center (
//                     child:
//                       ClipRRect(
//                         borderRadius: const BorderRadius.all(const Radius.circular(100)),
//                         // child: Image.network(trainer['profile_picture'], width: 70, height: 70)
//                       )
//                   )
//               ),
//               Column(
//                 children: [
//                   Text('Nome', style: TextStyle(fontSize: 18.0)),
//                   Divider(),
//                   Text('Preço',  style: TextStyle(fontSize: 18.0)),
//                 ],
//               )

//             ],
//           ),
//           Divider(),
//           Container (
//             margin: EdgeInsets.only(right: 10, left: 10),
//             width: double.infinity,
//             decoration:
//               BoxDecoration(
//                     border: Border.all(color: Colors.green),
//                     borderRadius: const BorderRadius.all(const Radius.circular(10)),
//               ), 
//             child: 
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child:
//                   Column (
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text('35 anos', style: TextStyle(fontSize: 16.0)),
//                       Text('3 anos atuando', style: TextStyle(fontSize: 16.0)),
//                       Text('Formação em Educação Física', style: TextStyle(fontSize: 16.0)),
//                       Text('Disponibilidade presenscial e remota', style: TextStyle(fontSize: 16.0)),

//                     ],
//                   ),                  
//               )

//           ),
//           Divider(),
//           Container (
//             child:
//               Column(
//                 children: [
//                   // Text('Horários', style: TextStyle(fontSize: 18.0)),
//                   // Divider(),
//                   Container (
//                     margin: EdgeInsets.only(right: 10, left: 10),
//                       width: double.infinity,
//                       decoration:
//                         BoxDecoration(
//                           border: Border.all(color: Colors.green),
//                           borderRadius: const BorderRadius.all(const Radius.circular(10)),
//                         ), 
//                       child: 
//                         Padding(
//                           padding: EdgeInsets.all(10),
//                           child:
//                             Row (
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Column (
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text('Segunda-feira', style: TextStyle(fontSize: 16.0)),
//                                     Text('Terça-feira', style: TextStyle(fontSize: 16.0)),
//                                     Text('Quarta-feira', style: TextStyle(fontSize: 16.0)),
//                                     Text('Quinta-feira', style: TextStyle(fontSize: 16.0)),
//                                     Text('Sexta-feira', style: TextStyle(fontSize: 16.0)),
//                                     Text('Sábado', style: TextStyle(fontSize: 16.0)),
//                                     Text('Domingo', style: TextStyle(fontSize: 16.0)),

//                                   ],
//                                 ),  
//                                 Column (
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     Text('10h as 22h', style: TextStyle(fontSize: 16.0)),
//                                     Text('10h as 22h', style: TextStyle(fontSize: 16.0)),
//                                     Text('10h as 22h', style: TextStyle(fontSize: 16.0)),
//                                     Text('10h as 22h', style: TextStyle(fontSize: 16.0)),
//                                     Text('10h as 22h', style: TextStyle(fontSize: 16.0)),
//                                     Text('10h as 22h', style: TextStyle(fontSize: 16.0)),
//                                     Text('10h as 22h', style: TextStyle(fontSize: 16.0)),

//                                   ],
//                                 ),  
//                               ]
//                             )
                            
//                         )
//                   )
//                 ]
//               )
//           ),
//           Divider(),
//           Container(
//             child:
//               Column(
//                 children: [
//                   Text('Avaliação (Média): 5.00', style: TextStyle(fontSize: 16.0)),
//                   Padding(
//                     padding: EdgeInsets.all(10),
//                     child: 
//                       Container (
//                         decoration:
//                           BoxDecoration(
//                             border: Border.all(color: Colors.green),
//                             borderRadius: const BorderRadius.all(const Radius.circular(10)),
//                           ), 
//                         child:
//                         Padding (
//                           padding: EdgeInsets.all(10),
//                           child: 
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Column(
//                                   children: [
//                                     Container(
//                                       width: 70,
//                                       height: 70,
//                                       decoration:
//                                         BoxDecoration(
//                                           border: Border.all(color: Colors.green),
//                                           borderRadius: const BorderRadius.all(const Radius.circular(100)),
//                                         ), 
//                                     ),
//                                     Divider(),
//                                     Row (
//                                       children: [
//                                         Text('Nome ', style: TextStyle(fontSize: 15.0)),
//                                         Text('Nome', style: TextStyle(fontSize: 15.0))
//                                       ],
//                                     )
//                                   ]
//                                 ),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Text('5.00',  style: TextStyle(fontSize: 18.0)),
//                                         // Text('estrelas'),
//                                       ],
//                                     ),
//                                     Divider(),
//                                     Text(' "Lorem ipsum dolor sit amet..."', style: TextStyle(fontStyle: FontStyle.italic),)
//                                   ],
//                                 )
//                               ]
//                             )
//                         ) 
//                       )
//                   ),
//                   FlatButton(
//                     color: Colors.transparent,
//                     textColor: Colors.green,
//                     padding: EdgeInsets.all(10.0),
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) { return AllAvaliations();}));
//                     },
//                     child: Text("Clique para ver todas avaliações", style: TextStyle(fontSize: 15.0))
//                   ),
//                 ],
//               )
//           ),
//           Divider(),
//           FlatButton(
//             color: Colors.blue,
//             textColor: Colors.white,
//             padding: EdgeInsets.all(10.0),
//             onPressed: () {
//                             /**/
//             },
//             child: Text("Portifólio", style: TextStyle(fontSize: 20.0))
//           ),
//           Container(
//             height: 80,
//             child: 
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   FlatButton(
//                     color: Colors.white,
//                     textColor: Colors.green,
//                       padding: EdgeInsets.all(10.0),
//                       onPressed: () {
//                         /**/
//                       },
//                     child: Text("Mensagem", style: TextStyle(fontSize: 20.0))
//                   ),
//                   FlatButton(
//                     color: Colors.green,
//                     textColor: Colors.white,
//                     padding: EdgeInsets.all(10.0),
//                     onPressed: () {
//                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {return ContractDef();}));
//                     },
//                     child: Text("Contratar", style: TextStyle(fontSize: 20.0))
//                   ),
//                 ],
//               )
//           )
//         ]
//     )
//     );

//   }
// }