import 'package:MyPersonal/pages/trainer_list.dart';
import 'package:MyPersonal/utils/colors.dart';
import 'package:flutter/material.dart';

class SearchStep extends StatefulWidget {
  @override
  _SearchStepPageState createState() => _SearchStepPageState();
}

class _SearchStepPageState extends State<SearchStep> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainBlack,
        body: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            height: 200,
            decoration: BoxDecoration(
              color: mainGreen,
              border: Border.all(color: mainGreen),
              borderRadius: const BorderRadius.all(const Radius.circular(15)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Agora está na hora de você encontrar seu Personal Trainer',
                    textAlign: TextAlign.center, 
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                ),
                
                RaisedButton(
                  color: Colors.transparent,
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TrainerListPage()));
                  },
                  splashColor: mainBlack,
                  child: Text(
                    'Vamos Lá',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
