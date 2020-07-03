import 'package:MyPersonal/models/contract_model.dart';
import 'package:MyPersonal/services/contract_service.dart';
import 'package:MyPersonal/utils/colors.dart';
import 'package:MyPersonal/utils/load_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyTainerProfile extends StatefulWidget {
  @override
  _MyTainerProfileState createState() => _MyTainerProfileState();
}

class _MyTainerProfileState extends State<MyTainerProfile> {
  ContractModel contract;
  final contractService = ContractService();
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _loadContract();
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
    return contract == null
        ? normalLoad()
        : Scaffold(
            backgroundColor: mainGreen,
            appBar: AppBar(
                title: Text('Meu Personal', textAlign: TextAlign.center),
                centerTitle: true,
                backgroundColor: mainBlack),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
                                border: Border.all(color: mainBlack),
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(100)),
                              ),
                              child: Center(child: Icon(Icons.person)
                                  // ClipRRect(
                                  //   borderRadius: const BorderRadius.all(const Radius.circular(100)),
                                  //   child: Image.asset('assets/img/indice.jpeg', width: 100, height: 100)
                                  // )
                                  )),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              '${contract.trainer.name} ${contract.trainer.lastname}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          RaisedButton(
                            color: Colors.transparent,
                            onPressed: () => null,
                            splashColor: Colors.blueGrey,
                            child: Text(
                              'Mensagem',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                        decoration: BoxDecoration(
                          color: mainBlack,
                          border: Border.all(color: Colors.black),
                          borderRadius:
                              const BorderRadius.all(const Radius.circular(15)),
                        ),
                        margin: EdgeInsets.all(10),
                        child: Column(children: [
                          Text(
                            'Contrato',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Divider(),
                          Container(
                              width: double.infinity,
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                        'Data de Início',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Data de Fim',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Tempo Contratado',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // Text('Status da Mensalidade', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                        contract.startDate.toString(),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        contract.closeDate.toString(),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        "closeDate - today",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      // Text("Pago ou Não", style: TextStyle(fontSize: 16),),
                                    ],
                                  )
                                ],
                              ))
                        ])),
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: mainBlack,
                          border: Border.all(color: Colors.black),
                          borderRadius:
                              const BorderRadius.all(const Radius.circular(15)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Disponibilidade Atual',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Divider(),
                            Container(
                                child: Text(
                              contract.trainer.availability.toString(),
                              style: TextStyle(fontSize: 15),
                            ))
                          ],
                        )),
                    Divider(),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 50),
                      child: RaisedButton(
                        color: Colors.yellow[200],
                        onPressed: () => null,
                        splashColor: Colors.grey[50],
                        child: Text(
                          'Avaliar',
                          style: TextStyle(
                            color: mainBlack,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.blueGrey[50],
                            onPressed: () {
                              // _goToContractingPage();
                            },
                            splashColor: Colors.red[50],
                            child: Text(
                              'Cancelar Serviços',
                              style: TextStyle(
                                color: mainBlack,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          RaisedButton(
                            color: mainBlack,
                            onPressed: () => null,
                            splashColor: Colors.red,
                            child: Text(
                              'Denunciar',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
