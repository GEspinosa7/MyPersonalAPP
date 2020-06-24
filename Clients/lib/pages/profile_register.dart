// import 'package:MyPersonal/models/student_profile_model.dart';
// import 'package:MyPersonal/pages/home.dart';
// import 'package:MyPersonal/services/student_profile_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class ProfileRegister extends StatefulWidget {
//   @override
//   _ProfileRegisterState createState() => _ProfileRegisterState();
// }

// class _ProfileRegisterState extends State<ProfileRegister> {
//   final _form = GlobalKey<FormState>();
//   var _profile = StudentProfileModel();
//   final _auth = FirebaseAuth.instance;
//   final _service = ProfileSService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(15),
//           child: Form(
//             key: _form,
//             child: Column(
//               children: <Widget>[
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Nome'),
//                   onSaved: (value) => _profile.name = value,
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Data de nascimento'),
//                   onSaved: (value) => _profile.birthDate = value,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(labelText: 'Altura'),
//                   onSaved: (value) => _profile.height = value as double,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(labelText: 'Peso'),
//                   onSaved: (value) => _profile.weight = value as double,
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Data de nascimento'),
//                   onSaved: (value) => _profile.objective = value,
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Data de nascimento'),
//                   onSaved: (value) => _profile.activeTime = value,
//                 ),
//                 Padding(padding: EdgeInsets.all(8)),
//                 RaisedButton(onPressed: _salvar, child: Text('Entrar')),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   _salvar() async {
//     _form.currentState.save();
//     _profile.uid = (await _auth.currentUser()).uid;

//     try {
//       final profile = await _service.criarProfile(_profile);
//       print(profile);
//       Navigator.of(context)
//           .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
//     } catch (e) {
//       print(e);
//     }

//   }
// }