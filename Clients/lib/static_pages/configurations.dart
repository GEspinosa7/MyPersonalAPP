// import 'package:MyPersonal/static_pages/my_profile.dart';
// import 'package:MyPersonal/static_pages/start.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

// class ConfigArea extends StatefulWidget {
//   @override
//   _ConfigAreaState createState() => _ConfigAreaState();
// }

// class _ConfigAreaState extends State<ConfigArea> {

//   final _auth = FirebaseAuth.instance;

//   @override
//   void initState() {
//     super.initState();
//       _auth.currentUser().then((user) {
//         setState(() => user.email);
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//             theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
//             debugShowCheckedModeBanner: false,
//             home: Scaffold(
//               appBar: AppBar(
//                 title: Text('Configurações', textAlign: TextAlign.center),
//                 centerTitle: true,
//                 backgroundColor: Colors.transparent,
//                 actions: <Widget>[
//                   IconButton(
//                     icon: Icon(Icons.arrow_back),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   )
//                 ],
//               ),
//               body: config()
//               ) 
//     );
//   }

//   showConfirmExit(BuildContext context) {

//     Widget cancelButton = FlatButton(
//       child: Text("Cancelar", style: TextStyle(color: Colors.green)),
//       onPressed:  () {Navigator.pop(context);},
//     );

//     Widget confirmButton = FlatButton(
//       child: Text("Sair", style: TextStyle(color: Colors.red)),
//       onPressed: () => _sair()
//     );

//     AlertDialog alert = AlertDialog(
//       title: Icon(Icons.power_settings_new, color: Colors.red, size: 80,),
//       content: Text("Tem certeza que deseja sair?"),
//       backgroundColor: darkBlue,
//       actions: [
//         cancelButton,
//         confirmButton,
//       ],
//     );

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }

//   Widget config(){
//     return Column(
//       children: <Widget>[
//         GestureDetector(
//           onTap: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context) {return MyProfile();}));
//           },
//           child:
//             configButton(name: 'Perfil', height: 100.0),
//         ),        
        
//         Divider(),
        
//         GestureDetector(
//           onTap: (){
// //
//           },
//           child:
//             configButton(name: 'Termos de Uso',),
//         ),
//         GestureDetector(
//           onTap: (){
// //
//           },
//           child:
//             configButton(name: 'Sobre o App',),
//         ),
//         GestureDetector(
//           onTap:  () {showConfirmExit(context);},
//           child:
//             configButton(name: 'Sair', nameColor: Colors.red, iconColor: Colors.red),
//         ),
//       ],
//     );
//   }

//   Widget configButton({name: ' ', height: 65.0, nameColor: Colors.white, iconColor: Colors.grey}){
//       return 
//           Container(
//             width: double.infinity,
//             height: height,
//             margin: EdgeInsets.all(5),
//               decoration:
//                 BoxDecoration(
//                   border: Border.all(color: Colors.green),
//                   borderRadius: const BorderRadius.all(const Radius.circular(10)),
//               ),
//             child: 
//               Center(
//                 child: 
//                   Padding(
//                     padding: EdgeInsets.all(10),
//                     child: 
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Text(name, style: TextStyle(color: nameColor, fontSize: 17),),
//                           Icon(Icons.arrow_forward_ios, color: iconColor, size: 17,)
//                         ],
//                       )
//                   )
//               )
//           );
//   }

//   _sair() async {
//     _auth.signOut();
//     Navigator.of(context).pushReplacement(MaterialPageRoute(
//         builder: (context) => StartPage(),
//     ));
//   }
// }