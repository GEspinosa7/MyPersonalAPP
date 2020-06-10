import 'package:MyPersonal/pages/trainerProfileB.dart';
import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class ContractDef extends StatefulWidget {
  @override
  _ContractDefState createState() => _ContractDefState();
}

class _ContractDefState extends State<ContractDef> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                // title: Text('Perfil', textAlign: TextAlign.center),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) { return TrainerBProfile();}));
                    },
                  )
                ],
              ),
              body: 
                  contractDefWidget() 
            )
    );
  }

  Widget contractDefWidget() {
    return 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Container (
            margin: EdgeInsets.only(right: 10, left: 10),
            width: double.infinity,
            height: 100,
            decoration:
              BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: const BorderRadius.all(const Radius.circular(10)),
              ), 
            child:  
              Center(
                child: 
                  Text('Você está pretes a contratar {nome_personal} para ser seu personal', 
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  )
              )
            ),
            Divider(),
            FlatButton(
              color: Colors.green,
                textColor: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {return ListTrainer();}));
                    
                  },
                  child: Text("Forma de Pagamento", style: TextStyle(fontSize: 20.0))
            )
          ]
        );
  }
}