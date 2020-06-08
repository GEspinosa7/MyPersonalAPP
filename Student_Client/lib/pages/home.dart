import 'package:MyPersonal/pages/evolution_gallery.dart';
import 'package:MyPersonal/pages/exercises_area.dart';
import 'package:MyPersonal/pages/help.dart';
import 'package:MyPersonal/pages/my_profile.dart';
import 'package:MyPersonal/pages/paymentMethods.dart';
import 'package:MyPersonal/pages/score_area.dart';
import 'package:MyPersonal/pages/trainerProfileA.dart';
import 'package:flutter/material.dart';
import 'configurations.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
              appBar: AppBar(
                title: Text('MyPersonal', textAlign: TextAlign.center),
                centerTitle: true,
                backgroundColor: Colors.transparent,
              ),
              body: SingleChildScrollView(child: homeScreen(),),
              drawer: Drawer(
              child: Container(
                color: darkBlue,
                child: ListView(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        DrawerHeader(
                          decoration: BoxDecoration(
                            color: darkBlue,
                          ),
                          child: 
                            Center(
                              child: 
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {return MyProfile();}));
                                      },
                                      child: 
                                        Container(
                                          width: 100,
                                          height: 100,
                                          margin: EdgeInsets.only(bottom: 10),
                                          decoration:
                                            BoxDecoration(
                                              border: Border.all(color: Colors.white),
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
                                    ),
                                    Text('Gabriel Espinosa', style: TextStyle(color: Colors.white),)
                                  ],
                                )

                            )
                        ),
                        ListTile(
                          title: Text('Pontuação'),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {return ScoreArea();}));
                          },
                        ),
                        Divider(),
                        ListTile(
                          title: Text('Pagamento'),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {return PaymentMethod();}));
                          },
                        ),
                        Divider(),
                        ListTile(
                          title: Text('Ajuda'),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {return HelpArea();}));
                          },
                        ),
                        Divider(),
                        ListTile(
                          title: Text('Confirguações'),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {return ConfigArea();}));
                          },
                        ),
                        Divider(),
                        ListTile(
                          title: Text('Convide Amigos'),
                          onTap: () {

                            Navigator.pop(context);
                          },
                        ),
                      ],
              ),
              )
        ),
      );  
  }
  
  showKeepAsking(BuildContext context) {

    Widget photoButton = FlatButton(
      child: Text("Enviar Foto", style: TextStyle(color: Colors.blue)),
      onPressed:  () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {return Gallery();}));
      },
    );
    
    Widget confirmButton = FlatButton(
      child: Text("Continuar sem foto", style: TextStyle(color: Colors.orange)),
      onPressed:  () {},
    );

    AlertDialog alert = AlertDialog(
      title: Text("Term certeza que não quer enviar uma foto?"),
      content: Text("Sem ela vocẽ não poderá acompanhar sua evolução"),
      backgroundColor: darkBlue,
      actions: [
        confirmButton,
        photoButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialog1(BuildContext context) {

    Widget photoButton = FlatButton(
      child: Text("Enviar Foto", style: TextStyle(color: Colors.blue)),
      onPressed:  () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {return Gallery();}));
      },
    );

    Widget cancelButton = FlatButton(
      child: Text("Não", style: TextStyle(color: Colors.red)),
      onPressed:  () {Navigator.pop(context);},
    );

    Widget confirmButton = FlatButton(
      child: Text("Sim, pontuar", style: TextStyle(color: Colors.green)),
      onPressed:  () {showKeepAsking(context);},
    );

    AlertDialog alert = AlertDialog(
      title: Text("Antes disso.."),
      content: Text("Você realmente treinou hoje?"),
      backgroundColor: darkBlue,
      actions: [
        cancelButton,
        confirmButton,
        photoButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget homeScreen(){
    return Center(
      child: 
        Column(
          children: [
            Divider(),
            Container(
            margin: EdgeInsets.all(20),
            width: double.infinity,
            height: 150,
            decoration:
              BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: const BorderRadius.all(const Radius.circular(10)),
              ), 
            child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Tipo de treino', style: TextStyle(fontSize: 18)),
                  Text('Divisão do treino', style: TextStyle(fontSize: 18)),
                  Text('Primero dia do treino', style: TextStyle(fontSize: 18)),
                  Text('Tempo com o mesmo treino', style: TextStyle(fontSize: 18)),
                ],
              )
            ),
            FlatButton(
              color: Colors.transparent,
                textColor: Colors.green,
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {return TrainerAProfile();}));
                  },
                  child: Text("Ver Personal", style: TextStyle(fontSize: 20.0))
            ),
            Divider(),
            Text('Esse é o seu treino de hoje', style: TextStyle(fontSize: 20),),
            Container(
            margin: EdgeInsets.all(20),
            width: double.infinity,
            decoration:
              BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: const BorderRadius.all(const Radius.circular(10)),
              ), 
            child:
              Padding(
                padding: EdgeInsets.all(10),
                child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Exercicio 1', style: TextStyle(fontSize: 18)),
                          Text('Exercicio 2', style: TextStyle(fontSize: 18)),
                          Text('Exercicio 3', style: TextStyle(fontSize: 18)),
                          Text('Exercicio 4', style: TextStyle(fontSize: 18)),
                          Text('Exercicio 5', style: TextStyle(fontSize: 18)),
                          Text('Exercicio 6', style: TextStyle(fontSize: 18)),
                          Text('Exercicio 7', style: TextStyle(fontSize: 18)),
                          Text('Exercicio 8', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('N° Repetições', style: TextStyle(fontSize: 18)),
                          Text('N° Repetições', style: TextStyle(fontSize: 18)),
                          Text('N° Repetições', style: TextStyle(fontSize: 18)),
                          Text('N° Repetições', style: TextStyle(fontSize: 18)),
                          Text('N° Repetições', style: TextStyle(fontSize: 18)),
                          Text('N° Repetições', style: TextStyle(fontSize: 18)),
                          Text('N° Repetições', style: TextStyle(fontSize: 18)),
                          Text('N° Repetições', style: TextStyle(fontSize: 18)),
                        ],
                      )
                    ],
                  )
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                color: Colors.blue,
                  textColor: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {return ExercisesArea();}));
                    },
                    child: Text("Treino completo", style: TextStyle(fontSize: 20.0))
                ),
                FlatButton(
                  color: Colors.green,
                    textColor: Colors.white,
                      padding: EdgeInsets.all(10.0),
                      onPressed: () {
                        showAlertDialog1(context);
                      },
                      child: Text("Pontuar", style: TextStyle(fontSize: 20.0))
                ),
              ],
            ),
          ],
        )
    );
  }
}