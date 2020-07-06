import 'package:MyPersonal/models/client_profile_model.dart';
import 'package:MyPersonal/models/contract_model.dart';
import 'package:MyPersonal/pages/my_training.dart';
import 'package:MyPersonal/pages/trainer_list.dart';
import 'package:MyPersonal/services/client_profile_service.dart';
import 'package:MyPersonal/services/contract_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'configurations.dart';
import 'package:MyPersonal/utils/colors.dart';
import 'package:MyPersonal/utils/load_screen.dart';
import 'my_personal_trainer_profile.dart';
import 'my_profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ClientModel clientProfile;
  final clientService = ClientService();

  ContractModel contract;
  final contractService = ContractService();

  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _auth.currentUser().then((user) async {
      await _loadClientProfile();
      _loadContract();
    });
  }

  _loadClientProfile() async {
    final _clientUser = await _auth.currentUser();
    final resp = await clientService.getClientProfile(_clientUser.uid);
    setState(() {
      clientProfile = resp;
    });
  }

  _loadContract() async {
    final _clientUser = await _auth.currentUser();
    final resp = await contractService.getContract(_clientUser.uid);
    setState(() {
      contract = resp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return clientProfile == null
        ? normalLoad()
        : Scaffold(
            appBar: AppBar(
                title: Text('Home', textAlign: TextAlign.center),
                centerTitle: true,
                backgroundColor: mainGreen),
            body: contract == null ? search() : home(),
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
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return MyProfile();
                              }));
                            },
                            child: Container(
                                width: 100,
                                height: 100,
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: mainBlack,
                                  border: Border.all(color: mainGreen),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(100)),
                                ),
                                child: Center(child: Icon(Icons.add_a_photo)
                                    // ClipRRect(
                                    //   borderRadius: const BorderRadius.all(const Radius.circular(100)),
                                    //   child: Image.asset('assets/img/indice.jpeg', width: 100, height: 100)
                                    // )
                                    )),
                          ),
                          Text(
                            clientProfile.name + " " + clientProfile.lastname,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ))),
                  ListTile(
                    title: Text('Meu Perfil'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MyProfile();
                      }));
                    },
                  ),
                  ListTile(
                    title: Text('Meu Personal'),
                    onTap: () {
                      contract == null
                          ? Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                              return TrainerListPage();
                            }))
                          : Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                              return MyTainerProfile();
                            }));
                    },
                  ),
                  ListTile(
                    title: Text('Configurações'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ConfigArea();
                      }));
                    },
                  ),
                  // ListTile(
                  //   title: Text('Pagamento'),
                  //   onTap: () {
                  //     print(clientProfile.id);
                  //   },
                  // ),
                  // ListTile(
                  //   title: Text('Ajuda'),
                  //   onTap: () {
                  //     print(clientProfile.uid);
                  //     print(clientProfile.id);
                  //     // Navigator.push(context, MaterialPageRoute(builder: (context) {return SearchStep();}));
                  //   },
                  // ),
                ],
              ),
            )));
  }

  Widget home() {
    return Container(
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyTainerProfile();
                }));
              },
              child: homeActions(
                  actionName: 'Personal Trainer', provcolor: mainGreen)),
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyTraining();
                }));
              },
              child:
                  homeActions(actionName: 'Meu Treino', provcolor: mainGreen)),
          // homeActions(actionName: 'Mensagens'),
          // homeActions(actionName: 'Evolução'),
          GestureDetector(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return AvaliationsArea();
              // }));
            },
          ),
        ],
      ),
    );
  }

  Widget homeActions({actionName: 'Bloco', provcolor: Colors.grey}) {
    return Container(
      width: 150,
      height: 110,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: provcolor,
        border: Border.all(color: mainGreen),
        borderRadius: const BorderRadius.all(const Radius.circular(15)),
      ),
      child: Center(
          child: Text(
        actionName,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      )),
    );
  }

  Widget search() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        height: 200,
        decoration: BoxDecoration(
          color: mainGreen,
          border: Border.all(color: mainGreen),
          borderRadius: const BorderRadius.all(const Radius.circular(15)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Voce ainda não tem um personal trainer',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                )),
            RaisedButton(
              color: Colors.transparent,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TrainerListPage()));
              },
              splashColor: mainBlack,
              child: Text(
                "Econtrar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
