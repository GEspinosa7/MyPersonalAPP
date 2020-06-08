import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class ExercisesArea extends StatefulWidget {
  @override
  _ExercisesAreaState createState() => _ExercisesAreaState();
}

class _ExercisesAreaState extends State<ExercisesArea> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: Text('Treino Completo', textAlign: TextAlign.center),
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
              body: SingleChildScrollView(
                child:
                  allExercises()
              ) 
            )
    );
  }

  Widget allExercises(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 120,
          margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom:60),
          child: 
            Center(
              child: 
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      color: Colors.grey,
                        textColor: Colors.black,
                          padding: EdgeInsets.all(10.0),
                          onPressed: () {
                              //
                          },
                          child: Text("Solicitar Treino", style: TextStyle(fontSize: 20.0))
                    ),
                    FlatButton(
                      color: Colors.white,
                        textColor: Colors.green,
                          padding: EdgeInsets.all(10.0),
                          onPressed: () {
                              //
                          },
                          child: Text("Pergunte ao Personal", style: TextStyle(fontSize: 20.0))
                    )
                  ],
                )
            )

        ),
        Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration:
                BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: const BorderRadius.all(const Radius.circular(10)),
                ), 
                child: 
                  Padding(
                    padding: EdgeInsets.all(15),
                    child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Dia da Semana', style: TextStyle(fontSize: 20),),
                          Divider(),
                          Container(
                            child: 
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text('Músculo', style: TextStyle(fontSize: 20),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Text('Exercicio 1'),
                                          Text('Exercicio 2'),
                                          Text('...'),
                                          Text('Exercicio 7'),
                                          Text('Exercicio 8'),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text('Repetições'),
                                          Text('Repetições'),
                                          Text('...'),
                                          Text('Repetições'),
                                          Text('Repetições'),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              )
                          )
                        ],
                      ) 
                  )
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration:
                BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: const BorderRadius.all(const Radius.circular(10)),
                ), 
                child: 
                  Padding(
                    padding: EdgeInsets.all(15),
                    child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Dia da Semana', style: TextStyle(fontSize: 20),),
                          Divider(),
                          Container(
                            child: 
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text('Músculo', style: TextStyle(fontSize: 20),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Text('Exercicio 1'),
                                          Text('Exercicio 2'),
                                          Text('...'),
                                          Text('Exercicio 7'),
                                          Text('Exercicio 8'),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text('Repetições'),
                                          Text('Repetições'),
                                          Text('...'),
                                          Text('Repetições'),
                                          Text('Repetições'),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              )
                          )
                        ],
                      ) 
                  )
            ),
          ],
        )
      ],
    );
  }
}