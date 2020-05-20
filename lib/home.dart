import 'package:MyPersonal/paymentMethods.dart';
import 'package:MyPersonal/trainerProfileA.dart';
import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: Text('MyPersonal', textAlign: TextAlign.center),
                centerTitle: true,
                backgroundColor: Colors.transparent,
              ),
              body: SingleChildScrollView(child: homeScreen(),),
              drawer: Drawer(
              child:
                ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: 
                        Center(
                          child: 
                            Column(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  margin: EdgeInsets.only(bottom: 10),
                                  decoration:
                                    BoxDecoration(
                                      border: Border.all(color: darkBlue),
                                      borderRadius: const BorderRadius.all(const Radius.circular(100)),
                                    ), 
                                  child:
                                    Center (
                                      child:
                                        Icon(Icons.add_a_photo)
                                        // ClipRRect(
                                        //   borderRadius: const BorderRadius.all(const Radius.circular(100)),
                                        //   child: Image.asset('assets/img/indice.jpeg', width: 100, height: 100)
                                        // )
                                    )
                                ),
                                Text('Gabriel Espinosa', style: TextStyle(color: darkBlue),)
                              ],
                            )

                        )
                    ),
                    ListTile(
                      title: Text('Pontuação'),
                      onTap: () {

                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('Pagamento'),
                      onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) {return PaymentMethod();}));
                      },
                    ),
                    ListTile(
                      title: Text('Ajuda'),
                      onTap: () {

                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('Segurança'),
                      onTap: () {

                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('Confirguações'),
                      onTap: () {

                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('Convide Amigos'),
                      onTap: () {

                        Navigator.pop(context);
                      },
                    ),
                  ],
          ),
        ),
      )     
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
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {return ListTrainer();}));
                    },
                    child: Text("Treino completo", style: TextStyle(fontSize: 20.0))
                ),
                FlatButton(
                  color: Colors.green,
                    textColor: Colors.white,
                      padding: EdgeInsets.all(10.0),
                      onPressed: () {
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {return ListTrainer();}));
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