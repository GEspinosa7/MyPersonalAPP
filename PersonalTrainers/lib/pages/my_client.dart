import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/models/client_model.dart';
import 'package:my_personal_personaltrainer/models/contract_model.dart';
import 'package:my_personal_personaltrainer/models/training_model.dart';
import 'package:my_personal_personaltrainer/pages/traning_creator.dart';
import 'package:my_personal_personaltrainer/services/client_service.dart';
import 'package:my_personal_personaltrainer/services/contract_service.dart';
import 'package:my_personal_personaltrainer/services/training_service.dart';
import 'package:my_personal_personaltrainer/utils/colors.dart';
import 'package:my_personal_personaltrainer/utils/load_screen.dart';

class MyClientProfile extends StatefulWidget {
  final ClientModel client;

  const MyClientProfile({Key key, @required this.client}) : super(key: key);

  @override
  _MyClientProfileState createState() => _MyClientProfileState();
}

class _MyClientProfileState extends State<MyClientProfile> {
  final service = ClientService();
  final tservice = TrainingService();
  final contractService = ContractService();
  TrainingModel training;
  ContractModel contract;

  @override
  void initState() {
    super.initState();
    _loadContract();
  }

  _loadContract() async {
    final clientuid = widget.client.uid;
    final resp = await contractService.getContract(clientuid);
    setState(() {
      contract = resp;
    });
  }

  _goToTrainingCreator() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return TrainingCreator(
        clientId: widget.client.id,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return contract == null
        ? normalLoad()
        : Scaffold(
            backgroundColor: mainBlack,
            appBar: AppBar(
                title: Text('Meu Aluno', textAlign: TextAlign.center),
                centerTitle: true,
                backgroundColor: mainGreen),
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
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(100)),
                                  child: Image.asset(
                                      'assets/img/perfil_fake.jpg',
                                      width: 100,
                                      height: 100))),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              '${widget.client.name} ${widget.client.lastname}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          // RaisedButton(
                          //   color: Colors.transparent,
                          //   onPressed: () => null,
                          //   splashColor: Colors.blueGrey,
                          //   child: Text(
                          //     'Mensagem',
                          //     style: TextStyle(
                          //       color: Colors.grey,
                          //       fontSize: 20,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                        decoration: BoxDecoration(
                          color: mainGreen,
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
                                    MainAxisAlignment.spaceAround,
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
                                      // Text("Pago ou Não", style: TextStyle(fontSize: 16),),
                                    ],
                                  )
                                ],
                              ))
                        ])),
                    // Container(
                    //     width: double.infinity,
                    //     margin: EdgeInsets.all(10),
                    //     padding: EdgeInsets.all(10),
                    //     decoration: BoxDecoration(
                    //       color: mainGreen,
                    //       border: Border.all(color: Colors.black),
                    //       borderRadius:
                    //           const BorderRadius.all(const Radius.circular(15)),
                    //     ),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //       children: <Widget>[
                    //         Text(
                    //           'Status do Treino',
                    //           style: TextStyle(
                    //               fontSize: 18, fontWeight: FontWeight.bold),
                    //         ),
                    //         Divider(),
                    //         Container(
                    //             child: Text(
                    //           'sem treino',
                    //           style: TextStyle(fontSize: 15),
                    //         ))
                    //       ],
                    //     )),
                    Divider(),
                    Text(
                      'Dados Físicos',
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
                            Flexible(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    'Tempo Ativo',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: mainBlack,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // Text(
                                  //   'Idade',
                                  //   style: TextStyle(
                                  //       fontSize: 17,
                                  //       color: mainBlack,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                  Text(
                                    'Peso',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: mainBlack,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Altura',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: mainBlack,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  widget.client.timeActive.toString(),
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: mainBlack,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Text(
                                //   widget.client.age.toString(),
                                //   style: TextStyle(
                                //       fontSize: 17,
                                //       color: mainBlack,
                                //       fontWeight: FontWeight.bold),
                                // ),
                                Text(
                                  widget.client.weight.toString(),
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: mainBlack,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.client.height.toString(),
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: mainBlack,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 50),
                      child: RaisedButton(
                        color: mainGreen,
                        onPressed: () {
                          print(widget.client.id);
                          _goToTrainingCreator();
                        },
                        splashColor: Colors.lightBlueAccent,
                        child: Text(
                          'Novo Treino',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.all(5),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     children: <Widget>[
                    //       RaisedButton(
                    //         color: Colors.blueGrey[50],
                    //         onPressed: () {
                    //           // _goToTrainingCreator();
                    //         },
                    //         splashColor: Colors.red[50],
                    //         child: Text(
                    //           'Cancelar Serviços',
                    //           style: TextStyle(
                    //             color: mainBlack,
                    //             fontSize: 20,
                    //           ),
                    //         ),
                    //       ),
                    //       RaisedButton(
                    //         color: mainBlack,
                    //         onPressed: () => null,
                    //         splashColor: Colors.red,
                    //         child: Text(
                    //           'Denunciar',
                    //           style: TextStyle(
                    //             color: Colors.red,
                    //             fontSize: 20,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
  }
}
