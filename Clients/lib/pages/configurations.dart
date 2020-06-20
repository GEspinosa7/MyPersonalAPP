import 'package:MyPersonal/pages/start.dart';
import 'package:MyPersonal/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
        backgroundColor: mainGreen,
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
    return Container(
      color: mainGreen,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context) {return ProfileConfigs();}));
            },
            child:
              configButton(name: 'Perfil', height: 80.0, borderColor: Colors.white),
          ),        
          
          Divider(),
          
          GestureDetector(
            onTap: (){
//
            },
            child:
              configButton(name: 'Termos de Uso', borderColor: Colors.white),
          ),
          GestureDetector(
            onTap: (){
//
            },
            child:
              configButton(name: 'Sobre o App', borderColor: Colors.white),
          ),
          GestureDetector(
            onTap:  () {showConfirmExit(context);},
            child:
              configButton(name: 'Sair', nameColor: Colors.red,iconColor: Colors.red,  borderColor: Colors.red),
          ),
        ],
      ),
    );
  }

  Widget configButton({
    name: ' ',
    height: 55.0,
    nameColor: Colors.white,
    iconColor: Colors.white,
    bgColor: Colors.transparent,
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