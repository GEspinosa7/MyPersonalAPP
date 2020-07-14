import 'package:MyPersonal/models/client_profile_model.dart';
import 'package:MyPersonal/models/contract_model.dart';
import 'package:MyPersonal/services/client_profile_service.dart';
import 'package:MyPersonal/services/contract_service.dart';
import 'package:MyPersonal/utils/colors.dart';
import 'package:MyPersonal/utils/load_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  ClientModel clientProfile;
  final service = ClientService();
  final _auth = FirebaseAuth.instance;

  ContractModel contract;
  final contractService = ContractService();

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
    final resp = await service.getClientProfile(_clientUser.uid);
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
              title: Text('Meu Perfil', textAlign: TextAlign.center),
              centerTitle: true,
              backgroundColor: mainBlack,
              // actions: [
              //   IconButton(
              //     icon: Icon(Icons.edit),
              //     onPressed: () {
              //       // Navigator.pop(context);
              //     },
              //   )
              // ],
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 200,
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: mainGreen,
                              border: Border.all(color: mainGreen),
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(100)),
                            ),
                            child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(100)),
                                child: Image.asset('assets/img/me_fake.jpg',
                                    width: 100, height: 100))),
                        Text(
                          clientProfile.name + " " + clientProfile.lastname,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Text(
                    'Dados',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: mainGreen,
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(15)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                'Tempo Ativo',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: mainBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              // Text(
                              //   'Idade',
                              //   style: TextStyle(
                              //       fontSize: 18,
                              //       color: mainBlack,
                              //       fontWeight: FontWeight.bold),
                              // ),
                              Text(
                                'Peso',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: mainBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Altura',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: mainBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                clientProfile.timeActive.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: mainBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              // Text(
                              //   clientProfile.birthDate.toString(),
                              //   style: TextStyle(
                              //       fontSize: 18,
                              //       color: mainBlack,
                              //       fontWeight: FontWeight.bold),
                              // ),
                              Text(
                                clientProfile.weight.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: mainBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                clientProfile.height.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: mainBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      )),
                  Divider(),
                  Text(
                    'Situação com Personal Trainer',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: mainGreen,
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(15)),
                      ),
                      child: contract == null ? noContract() : yesContract())
                ],
              ),
            ));
  }

  Widget noContract() {
    return Text(
      'Você ainda está sem um Personal Trainer',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 18, color: mainBlack, fontWeight: FontWeight.bold),
    );
  }

  Widget yesContract() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Data de Início de contrato',
              style: TextStyle(
                  fontSize: 18, color: mainBlack, fontWeight: FontWeight.bold),
            ),
            Text(
              'Data Final',
              style: TextStyle(
                  fontSize: 18, color: mainBlack, fontWeight: FontWeight.bold),
            ),
            // Text(
            //   'Tempo Contratado',
            //   style: TextStyle(
            //       fontSize: 18, color: mainBlack, fontWeight: FontWeight.bold),
            // ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              contract.startDate.toString(),
              style: TextStyle(
                  fontSize: 18, color: mainBlack, fontWeight: FontWeight.bold),
            ),
            Text(
              contract.closeDate.toString(),
              style: TextStyle(
                  fontSize: 18, color: mainBlack, fontWeight: FontWeight.bold),
            ),
            // Text(
            //   'Tempo Contratado',
            //   style: TextStyle(
            //       fontSize: 18, color: mainBlack, fontWeight: FontWeight.bold),
            // ),
          ],
        )
      ],
    );
  }
}
