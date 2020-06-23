import 'package:flutter/material.dart';

import 'change_email1.dart';
import 'change_pass.dart';
import 'delete_account.dart';
import 'phone_number.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: Text('Meu Perfil', textAlign: TextAlign.center),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              body: profile()
            )
    );
  }

  Widget profile(){
    return Column(
      children: <Widget>[
        Container(
          height: 250,
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, bottom: 20, right: 5, left: 5),
          decoration:
            BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: const BorderRadius.all(const Radius.circular(10)),
            ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration:
                    BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: const BorderRadius.all(const Radius.circular(100)),
                    ), 
                  child:
                    Center (
                      child:
                        // Icon(Icons.add_a_photo)
                        ClipRRect(
                          borderRadius: const BorderRadius.all(const Radius.circular(100)),
                          child: Image.asset('assets/img/eu.jpg', width: 100, height: 100)
                        )
                    )
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Adicionar/Alterar imagem de perfil', style: TextStyle(fontSize: 17),),
                      Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 17,)
                    ],
                  )
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text('Gabriel Espinosa', style: TextStyle(fontSize: 20),),
                )
              ],
            ),
          )
        ),
        Divider(),
        Container(

        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {return PhoneNumber();}));
          },
          child: profileAction(name: 'Adicionar/Alterar Telefone')
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {return ChangeEmail();}));
          },
          child: profileAction(name: 'Alterar E-mail')
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {return ChangePass();}));
          },
          child: profileAction(name: 'Alterar Senha')
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {return DeleteAccount();}));
          },
          child: profileAction(name: 'Excluir minha conta', nameColor: Colors.red, iconColor: Colors.red)
        ),      
      ],
    );
  }

  Widget profileAction({name: ' ', nameColor: Colors.white, iconColor: Colors.white70}){
      return 
          Container(
            width: double.infinity,
            height: 40,
            margin: EdgeInsets.all(10),
              decoration:
                BoxDecoration(
                  border: Border.all(color: Colors.green),
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
                          Text(name, style: TextStyle(color: nameColor, fontSize: 14),),
                          Icon(Icons.arrow_forward_ios, color: iconColor, size: 15)
                        ],
                      )
                  )
              )
          );
  }
}