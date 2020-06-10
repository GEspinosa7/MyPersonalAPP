import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class TrainerConductArea extends StatefulWidget {
  @override
  _TrainerConductAreaState createState() => _TrainerConductAreaState();
}

class _TrainerConductAreaState extends State<TrainerConductArea> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: Text('Conduta do Personal', textAlign: TextAlign.center),
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
              body: trainerconduct()
              ) 
    );
  }

  Widget trainerconduct(){
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            print('teste');
          },
          child:
            trainerconductButton(name: 'Como avalio o personal?',),
        ),
        GestureDetector(
          onTap: (){
            //
          },
          child:
            trainerconductButton(name: 'Marcou treino presencial e não apareceu',),
        ),
        GestureDetector(
          onTap: (){
            print('teste');
          },
          child:
            trainerconductButton(name: 'Ocorreu um abuso',),
        ),
        GestureDetector(
          onTap: (){
            print('teste');
          },
          child:
            trainerconductButton(name: 'Parou de enviar novos treinos',),
        ),
        GestureDetector(
          onTap: (){
            print('teste');
          },
          child:
            trainerconductButton(name: 'Parou de realizar suas consultorias',),
        ),
      ],
    );
  }

  Widget trainerconductButton({name: ' '}){
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