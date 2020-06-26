import 'package:MyPersonal/models/client_profile_model.dart';
import 'package:MyPersonal/models/contract_model.dart';
import 'package:MyPersonal/pages/home.dart';
import 'package:MyPersonal/services/client_profile_service.dart';
import 'package:MyPersonal/services/contract_service.dart';
import 'package:MyPersonal/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ContractingPage extends StatefulWidget {
  final int trainerId;

  const ContractingPage({Key key, @required this.trainerId}) : super(key: key);

  @override
  _ContractingPageState createState() => _ContractingPageState();
}

class _ContractingPageState extends State<ContractingPage> {

  final _form = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  var _contract = ContractModel();
  final _contractService = ContractService();

  @override
  Widget build(BuildContext context) {
    
    DateTime _startDate;
    DateTime _endDate;


    return Scaffold(
      appBar: AppBar(
        title: Text('Contrato'),
        centerTitle: true,
      ),
      backgroundColor: mainGreen,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                Container(
                  decoration:
                    BoxDecoration(
                      color: mainBlack,
                      border: Border.all(color: Colors.white),
                      borderRadius: const BorderRadius.all(const Radius.circular(15)),
                    ),
                  margin: EdgeInsets.only(bottom: 15),
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('Dados Contratuais', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18),),   
                      Divider(),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: RaisedButton(
                          color: mainGreen,
                          padding: EdgeInsets.all(10),
                          child: Text(
                             _startDate == null ? 'Data de Inicio' : _startDate.toString(),
                            style: TextStyle(fontSize: 15)
                          ),
                          onPressed: () {
                            showDatePicker(  
                              context: context,
                              initialDate: _startDate == null ? DateTime.now() : _startDate,
                              firstDate: DateTime(1800),
                              lastDate: DateTime(3000)
                            ).then((date) {
                              setState(() {
                                _startDate = date;
                                _contract.startDate = date.toString();
                              });
                            });
                          },
                        ),
                      ),      
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: RaisedButton(
                          color: mainGreen,
                          padding: EdgeInsets.all(10),
                          child: Text(
                             _endDate == null ? 'Data de Encerramento' : _endDate.toString(),
                            style: TextStyle(fontSize: 15)
                          ),
                          onPressed: () {
                            showDatePicker(  
                              context: context,
                              initialDate: _endDate == null ? DateTime.now() : _endDate,
                              firstDate: DateTime(1800),
                              lastDate: DateTime(3000)
                            ).then((date) {
                              setState(() {
                                _endDate = date;
                                _contract.closeDate = date.toString();
                              });
                            });
                          },
                        ),
                      ),           
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                RaisedButton(
                  onPressed: _saveContract,
                  color: mainBlack,
                  splashColor: mainGreen,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Contratar',
                    style: TextStyle(fontSize: 20),),
                ),
                // RaisedButton(onPressed: _sair, child: Text('sair'), color: mainGreen,),
              ],
            ),
          ),
        ),
      ),
    );
  }

    _saveContract() async {
    _contract.trainerId = widget.trainerId;

    if (_form.currentState.validate()){
      _form.currentState.save();
      try {
        final contract = await _contractService.createContract(_contract);
        // print(_client.uid);
        print(contract.id);
        print("Treinador:");
        print(contract.trainerId);
        print("Client:");
        print(contract.clientId);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
      } catch (e) {
        print(e);
      }
    }
  }
}