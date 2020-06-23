// import 'package:flutter/material.dart';

// import 'trainerProfileB.dart';


// final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

// class AllAvaliations extends StatefulWidget {
//   @override
//   _AllAvaliationsState createState() => _AllAvaliationsState();
// }

// class _AllAvaliationsState extends State<AllAvaliations> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//             theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
//             debugShowCheckedModeBanner: false,
//             home: Scaffold(
//               appBar: AppBar(
//                 title: Text('Avaliações', textAlign: TextAlign.center),
//                 centerTitle: true,
//                 backgroundColor: Colors.transparent,
//                 actions: <Widget>[
//                   IconButton(
//                     icon: Icon(Icons.arrow_back),
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) { return TrainerBProfile();}));
//                     },
//                   )
//                 ],
//               ),
//               body: SingleChildScrollView(
//                 child:
//                   allAvaliations() 
//               ) 
//             )
//     );
//   }

//   Widget allAvaliations() {
//     return Center(
//       child: 
//       Container(
//         margin: EdgeInsets.all(15),
//         child: 
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children:[
//               Container(
//               margin: EdgeInsets.only(bottom: 10),
//               width: 100,
//               height: 100,
//               decoration:
//                 BoxDecoration(
//                   border: Border.all(color: Colors.green),
//                   borderRadius: const BorderRadius.all(const Radius.circular(100)),
//                 ), 
//               ),
//               Text('Nome Sobrenome', style: TextStyle(fontSize: 18.0)),
//               Divider(),
//               Container(
//                 margin: EdgeInsets.all(15),
//                 constraints: 
//                 BoxConstraints(
//                   minHeight: 150,
//                   minWidth: double.infinity,
//                   maxWidth: double.infinity,
//                   maxHeight: double.infinity                
//                 ),
//                 decoration:
//                 BoxDecoration(
//                   border: Border.all(color: Colors.green),
//                   borderRadius: const BorderRadius.all(const Radius.circular(10)),
//                 ),

//                 child:
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Column(
//                             children: [
//                               Container(
//                                 width: 65,
//                                 height: 65,
//                                 margin: EdgeInsets.only(top:10, bottom: 5),
//                                 decoration:
//                                   BoxDecoration(
//                                     border: Border.all(color: Colors.green),
//                                     borderRadius: const BorderRadius.all(const Radius.circular(100)),
//                                   ), 
//                               ),
//                               Text('nome sobrenome'),
//                             ],
//                           ),
//                           Text('5.00', style: TextStyle(fontSize: 18.0))
//                         ],
//                       ),
//                       Divider(),
//                       Container(
//                         margin: EdgeInsets.all(10),
//                         child:
//                         Text(' "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ac tincidunt sem, non pharetra libero. Nullam quis est et mi ultricies consequat suscipit non metus. Praesent tempor, tortor eu pulvinar volutpat, justo mi lobortis nibh, ut volutpat nisi libero accumsan lectus. Vestibulum vel arcu bibendum, consequat felis ac, dapibus lorem. Praesent viverra non quam non aliquam. Quisque at interdum justo. Curabitur ligula lectus, sollicitudin porttitor tempus eu, suscipit eu metus. Cras imperdiet libero sit amet pellentesque maximus. Aenean egestas ut quam nec vehicula. Donec tempus leo vel lectus mattis pellentesque. Cras vitae tincidunt ipsum. Sed ultricies finibus aliquam. Nullam vulputate ex vitae ligula consectetur scelerisque. Nunc aliquam odio eu felis dignissim, nec eleifend velit mattis. "', 
//                         textAlign: TextAlign.justify, 
//                         style: TextStyle(fontStyle: FontStyle.italic),
//                         ),
//                        )
//                     ],
//                   ),
//               ),
//             ]
//           ),
//       )
//     );
//   }
// }