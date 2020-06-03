import 'package:MyPersonal/evolution_gallery.dart';
import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class ScoreArea extends StatefulWidget {
  @override
  _ScoreAreaState createState() => _ScoreAreaState();
}

class _ScoreAreaState extends State<ScoreArea> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: Text('Area de Pontuação', textAlign: TextAlign.center),
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
                  scoreStatus()
              ) 
            )
    );
  }

  Widget scoreStatus(){
    return Center(
      child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 40, left: 10, right: 10, bottom:60),
              width: double.infinity,
              height: 100,
              decoration:
              BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: const BorderRadius.all(const Radius.circular(10)),
              ),  
              child: 
                Padding(
                  padding: EdgeInsets.all(5),
                  child:(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Geral'),
                        Container(
                          child: 
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text('Estabilidade'),
                                    Text('100%'),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text('Treinos Feitos'),
                                    Text('1000000'),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text('Recorde de Dias'),
                                    Text('99999 Seguidos'),
                                  ],
                                ),
                              ],
                            )
                        )
                      ],
                    )
                  )
                )
            ),
            Container(
              child: 
                Text('Suas Estatísticas', style: TextStyle(fontSize: 20),)
            ),
            Container(
              width: double.infinity,
              height: 180,
              margin: EdgeInsets.all(10),
              decoration:
              BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: const BorderRadius.all(const Radius.circular(10)),
              ),
              child: 
                Center(
                  child: 
                    Text('Gráfico de estabilidade')
                )
            ),
            Divider(),
            Container(
              width: double.infinity,
              height: 180,
              margin: EdgeInsets.all(10),
              decoration:
              BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: const BorderRadius.all(const Radius.circular(10)),
              ),
              child: 
                Center(
                  child: 
                    Text('Dias feitos')
                )
            ),
            Divider(),
              Container(
                height: 90,
                margin: EdgeInsets.all(10),
                child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('Acompanhe sua evolução ', style: TextStyle(fontSize: 20),),
                      FlatButton(
                      color: Colors.white,
                        textColor: Colors.green,
                          padding: EdgeInsets.all(10.0),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) { return Gallery();}));
                          },
                      child: Text("Ver Fotos", style: TextStyle(fontSize: 16.0))
                    ),
                    ],
                  ) 
            ),
          ],
        )
    );
  }
}