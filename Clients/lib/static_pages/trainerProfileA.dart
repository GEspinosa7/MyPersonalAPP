// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'avaliationArea.dart';
// import 'cancelServices.dart';
// import 'searchTrainer.dart';

// final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

// class TrainerAProfile extends StatefulWidget {
//   @override
//   _TrainerAProfileState createState() => _TrainerAProfileState(); 
// }


// class _TrainerAProfileState extends State<TrainerAProfile> { 
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
//           Container(
//             width: 100,
//             height: 100,
//             decoration:
//               BoxDecoration(
//                 border: Border.all(color: Colors.green),
//                 borderRadius: const BorderRadius.all(const Radius.circular(100)),
//               ), 
//             child:
//               Center (
//                 child:
//                   ClipRRect(
//                     borderRadius: const BorderRadius.all(const Radius.circular(100)),
//                     // child: Image.network(trainer['profile_picture'], width: 70, height: 70)
//                   )
//               )
//           ),
//           Text('Nome', style: TextStyle(fontSize: 18.0)),
//           Divider(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               FlatButton(
//                 color: Colors.white,
//                   textColor: Colors.green,
//                     padding: EdgeInsets.all(10.0),
//                     onPressed: () {
//                       /**/
//                     },
//                 child: Text("Portifólio", style: TextStyle(fontSize: 16.0))
//               ),
//               FlatButton(
//                 color: Colors.white,
//                   textColor: Colors.green,
//                     padding: EdgeInsets.all(10.0),
//                     onPressed: () {
//                       /**/
//                     },
//                 child: Text("Mensagem", style: TextStyle(fontSize: 16.0))
//               ),
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
//                     Container (
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
//                       Text('Status Mensalidade', style: TextStyle(fontSize: 16.0)),
//                       Text('Treinos Criados', style: TextStyle(fontSize: 16.0)),
//                       Text('Tempo contratado', style: TextStyle(fontSize: 16.0)),
//                     ],
//                   ),                  
//               )

//           ),
//           Divider(),
//           Container (
//           margin: EdgeInsets.only(right: 10, left: 10),
//             width: double.infinity,
//             decoration:
//               BoxDecoration(
//                 border: Border.all(color: Colors.green),
//                 borderRadius: const BorderRadius.all(const Radius.circular(10)),
//               ), 
//             child: 
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child:
//                   Row (
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Column (
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Segunda-feira', style: TextStyle(fontSize: 16.0)),
//                           Text('Terça-feira', style: TextStyle(fontSize: 16.0)),
//                           Text('Quarta-feira', style: TextStyle(fontSize: 16.0)),
//                           Text('Quinta-feira', style: TextStyle(fontSize: 16.0)),
//                           Text('Sexta-feira', style: TextStyle(fontSize: 16.0)),
//                           Text('Sábado', style: TextStyle(fontSize: 16.0)),
//                           Text('Domingo', style: TextStyle(fontSize: 16.0)),

//                         ],
//                       ),  
//                       Column (
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Text('10h as 22h', style: TextStyle(fontSize: 16.0)),
//                           Text('10h as 22h', style: TextStyle(fontSize: 16.0)),
//                           Text('10h as 22h', style: TextStyle(fontSize: 16.0)),
//                           Text('10h as 22h', style: TextStyle(fontSize: 16.0)),
//                           Text('10h as 22h', style: TextStyle(fontSize: 16.0)),
//                           Text('10h as 22h', style: TextStyle(fontSize: 16.0)),
//                           Text('10h as 22h', style: TextStyle(fontSize: 16.0)),

//                         ],
//                       ),  
//                     ]
//                   )
                  
//               )
//           ),
//           Divider(),
//           FlatButton(
//             color: Colors.grey,
//               textColor: Colors.black,
//                 padding: EdgeInsets.all(10.0),
//                 onPressed: () {
//                    Navigator.push(context, MaterialPageRoute(builder: (context) { return AvaliationArea();}));
//                 },
//                 child: Text("Avaliar", style: TextStyle(fontSize: 20.0))
//           ),
//           Container(
//             height: 110,
//             child: 
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   FlatButton(
//                     color: Colors.white,
//                     textColor: Colors.red,
//                       padding: EdgeInsets.all(10.0),
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) { return CancelServices();}));
//                       },
//                     child: Text("Cancelar Serviços", style: TextStyle(fontSize: 20.0))
//                   ),
//                   FlatButton(
//                     color: Colors.redAccent,
//                       textColor: Colors.white,
//                         padding: EdgeInsets.all(10.0),
//                         onPressed: () {
//                           /**/
//                         },
//                     child: Text("Denunciar", style: TextStyle(fontSize: 20.0))
//                   ),
//                 ],
//               )
//           )
//         ]
//     )
//     );

//   }
// }