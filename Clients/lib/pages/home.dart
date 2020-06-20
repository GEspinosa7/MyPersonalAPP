//Authentication
import 'package:MyPersonal/models/client_profile_model.dart';
import 'package:MyPersonal/services/client_profile_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Material
import 'package:flutter/material.dart';

// Pages
import 'package:MyPersonal/pages/profile.dart';
import 'configurations.dart';

//Utils
import 'package:MyPersonal/utils/colors.dart';
import 'package:MyPersonal/utils/load_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ClientModel clientProfile;
  final service = ClientService();
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
      _auth.currentUser().then((user) {
        _loadClientProfile();
      });
  }

  _loadClientProfile() async {
    final _clientUser = await _auth.currentUser();
    final resp = await service.getClientProfile(_clientUser.uid);
    setState(() {
      clientProfile = resp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return clientProfile == null ? normalLoad() : Scaffold(
				appBar: AppBar (
          title: Text('Home', textAlign: TextAlign.center),
          centerTitle: true,
          backgroundColor: mainGreen
        ),
        body: home(),
        backgroundColor: mainBlack,
         drawer: Drawer(
          child: Container(
            color: mainGreen,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: mainBlack,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) {return MyProfile();}));
                            },
                          child: Container(
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.only(bottom: 10),
                            decoration:
                              BoxDecoration(
                                color: mainBlack,
                                border: Border.all(color: mainGreen),
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
                        ),
                          Text(clientProfile.name + " " + clientProfile.lastname, style: TextStyle(color: Colors.white),)
                      ],
                    )
                  )
                ),
                ListTile(
                  title: Text('Meu Perfil'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {return MyProfile();}));
                  },
                ),
                ListTile(
                  title: Text('Meu Personal'),
                  onTap: () {
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) {return HelpArea();}));
                  },
                ),
                ListTile(
                  title: Text('Configurações'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {return ConfigArea();}));
                  },
                ),
                ListTile(
                  title: Text('Pagamento'),
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {return ConfigArea();}));
                  },
                ),
                ListTile(
                  title: Text('Ajuda'),
                  onTap: () {

                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          )
        )
    );
  }

  showKeepAsking(BuildContext context) {

    Widget photoButton = FlatButton(
      child: Text("Enviar Foto", style: TextStyle(color: Colors.blue)),
      onPressed:  () {
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {return Gallery();}));
      },
    );
    
    Widget confirmButton = FlatButton(
      child: Text("Continuar sem foto", style: TextStyle(color: Colors.orange)),
      onPressed:  () {},
    );

    AlertDialog alert = AlertDialog(
      title: Text("Deseja comprovar com uma foto?"),
      content: Text("Com isso você poderá acompanhar sua evolução"),
      backgroundColor: mainBlack,
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

  Widget home(){
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(20, 15, 20, 20),
              width: double.infinity,
              padding: EdgeInsets.all(10),
              height: 150,
              decoration: BoxDecoration(
                color: mainGreen,
                border: Border.all(color: mainGreen),
                borderRadius: const BorderRadius.all(const Radius.circular(15)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Tipo de Treino(AB,ABCDE..)', style: TextStyle(fontSize: 18),),
                  Text('Divisão do treino(vezes na semana)', style: TextStyle(fontSize: 18),),
                  Text('Dia que começou o novo treino', style: TextStyle(fontSize: 18),),
                  Text('Tempo com o mesmo treino', style: TextStyle(fontSize: 18),),
                ],
              ),
            ),
            RaisedButton(
              color: Colors.lightBlue,
              onPressed: ()=> null,
              splashColor: mainGreen,
              child: Text('Ver Personal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Divider(),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text('Seu treino de hoje', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 15, 20, 20),
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: mainGreen,
                      border: Border.all(color: mainGreen),
                      borderRadius: const BorderRadius.all(const Radius.circular(15)),
                    ),
                    child: Row(
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        color: mainGreen,
                        onPressed: ()=> null,
                        splashColor: mainBlack,
                        child: Text('Treino Completo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      RaisedButton(
                        color: Colors.transparent,
                        onPressed: () => showAlertDialog1(context),
                        splashColor: mainGreen,
                        child: Text('Pontuar',
                          style: TextStyle(
                            color: mainGreen,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  )  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}