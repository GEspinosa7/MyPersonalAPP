import 'package:MyPersonal/app_doubts.dart';
import 'package:MyPersonal/trainer_conduct.dart';
import 'package:flutter/material.dart';

import 'security.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class HelpArea extends StatefulWidget {
  @override
  _HelpAreaState createState() => _HelpAreaState();
}

class _HelpAreaState extends State<HelpArea> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: Text('Ajuda', textAlign: TextAlign.center),
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
              body: help()
              ) 
    );
  }

  Widget help(){
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {return SecurityArea();}));
          },
          child:
            helpButton(name: 'Segurança',),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {return TrainerConductArea();}));
          },
          child:
            helpButton(name: 'Conduta do Personal',),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {return AppDoubtsArea();}));
          },
          child:
            helpButton(name: 'Aplicativo',),
        ),
      ],
    );
  }

  Widget helpButton({name: ' '}){
      return 
          Container(
            width: double.infinity,
            height: 65,
            margin: EdgeInsets.all(5),
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
                          Text(name),
                          Icon(Icons.arrow_forward_ios, color: Colors.grey,)
                        ],
                      )
                  )
              )
          );
  }
}