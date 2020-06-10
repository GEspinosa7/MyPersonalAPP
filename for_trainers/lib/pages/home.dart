import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/pages/start.dart';
import 'package:my_personal_personaltrainer/utils/colors.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  var _userEmail = '';


  @override
  void initState() {
    super.initState();
      _auth.currentUser().then((user) {
        setState(() =>_userEmail = user.email);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
				appBar: AppBar (
          title: Text('MyPersonal', textAlign: TextAlign.center),
          centerTitle: true,
          backgroundColor: mainBlack
        ),
        body: home(),
        backgroundColor: mainGreen,
         drawer: Drawer(
              child: Container(
                color: mainBlack,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: mainGreen,
                      ),
                      child: 
                        Center(
                          child: 
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) {return MyProfile();}));
                                  },
                                  child: 
                                    Container(
                                      width: 100,
                                      height: 100,
                                      margin: EdgeInsets.only(bottom: 10),
                                      decoration:
                                        BoxDecoration(
                                          border: Border.all(color: Colors.black),
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
                                Text(_userEmail, style: TextStyle(color: Colors.black),)
                              ],
                            )

                        )
                    ),
                    ListTile(
                      title: Text('Portifólio'),
                      onTap: () {
                        //  Navigator.push(context, MaterialPageRoute(builder: (context) {return ScoreArea();}));
                      },
                    ),
                    ListTile(
                      title: Text('Pagamento'),
                      onTap: () {
                        //  Navigator.push(context, MaterialPageRoute(builder: (context) {return PaymentMethod();}));
                      },
                    ),
                    ListTile(
                      title: Text('Avaliações'),
                      onTap: () {
                        //  Navigator.push(context, MaterialPageRoute(builder: (context) {return PaymentMethod();}));
                      },
                    ),
                    ListTile(
                      title: Text('Mensagens'),
                      onTap: () {
                        //  Navigator.push(context, MaterialPageRoute(builder: (context) {return PaymentMethod();}));
                      },
                    ),
                    ListTile(
                      title: Text('Ajuda'),
                      onTap: () {
                        //  Navigator.push(context, MaterialPageRoute(builder: (context) {return HelpArea();}));
                      },
                    ),
                    ListTile(
                      title: Text('Confirguações'),
                      onTap: () {

                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('Sair'),
                      onTap: () {
                        _sair();
                      },
                    ),
                  ],
                ),
              )
        )
    );
  }

  Widget home(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  homeActions(),
                  homeActions(),
                  homeActions(),
                  homeActions(),
                ]
              ),
              Column(
                children: <Widget>[
                  homeActions(),
                  homeActions(),
                  homeActions(),
                  homeActions(),
                ]
              ),
            ]
        )
      ]
    );
  }

  Widget homeActions({text: 'Bloco' }){
    return Container(
      width: 150,
      height: 110,
      color: mainBlack,
      margin: EdgeInsets.all(15),
      child: Center(
        child: Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 20),) 
      ),
    );
  }

  _sair() async {
    _auth.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => StartPage(),
    ));
  }
}