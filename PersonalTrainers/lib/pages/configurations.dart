import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_personal_personaltrainer/pages/profile_configurations.dart';
import 'package:my_personal_personaltrainer/pages/start.dart';
import 'package:my_personal_personaltrainer/utils/colors.dart';

class ConfigArea extends StatefulWidget {
  @override
  _ConfigAreaState createState() => _ConfigAreaState();
}

class _ConfigAreaState extends State<ConfigArea> {

  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
      _auth.currentUser().then((user) {
        setState(() => user.email);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        centerTitle: true,
        backgroundColor: mainBlack,
      ),
      body: config() 
    );
  }

  showConfirmExit(BuildContext context) {

    Widget cancelButton = FlatButton(
      child: Text("Cancelar", style: TextStyle(color: mainGreen)),
      onPressed:  () {Navigator.pop(context);},
    );

    Widget confirmButton = FlatButton(
      child: Text("Sim", style: TextStyle(color: Colors.red)),
      onPressed: () => _sair()
    );

    AlertDialog alert = AlertDialog(
      title: Icon(Icons.power_settings_new, color: Colors.red, size: 80,),
      content: Text("Tem certeza que deseja sair?"),
      backgroundColor: mainBlack,
      actions: [
        cancelButton,
        confirmButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget config(){
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {return ProfileConfigs();}));
          },
          child:
            configButton(name: 'Perfil', height: 80.0, bgColor: mainGreen),
        ),        
        
        Divider(),
        
        GestureDetector(
          onTap: (){
//
          },
          child:
            configButton(name: 'Termos de Uso', bgColor: mainGreen),
        ),
        GestureDetector(
          onTap: (){
//
          },
          child:
            configButton(name: 'Sobre o App', bgColor: mainGreen),
        ),
        GestureDetector(
          onTap:  () {showConfirmExit(context);},
          child:
            configButton(name: 'Sair', nameColor: Colors.red, iconColor: Colors.red, bgColor: mainBlack, borderColor: Colors.red),
        ),
      ],
    );
  }

  Widget configButton({
    name: ' ',
    height: 55.0,
    nameColor: Colors.black,
    iconColor: Colors.black,
    bgColor: Colors.green,
    borderColor: Colors.green
  }){
      return 
          Container(
            width: double.infinity,
            height: height,
            margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              decoration:
                BoxDecoration(
                  color: bgColor,
                  border: Border.all(color: borderColor),
                  borderRadius: const BorderRadius.all(const Radius.circular(10)),
              ),
            child: 
              Center(
                child: 
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(name, style: TextStyle(color: nameColor, fontSize: 17, fontWeight: FontWeight.bold),),
                          Icon(Icons.arrow_forward_ios, color: iconColor, size: 17,)
                        ],
                      )
                  )
              )
          );
  }

  _sair() async {
    _auth.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => StartPage(),
    ));
  }
}