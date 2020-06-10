import 'package:MyPersonal/pages/trainer_conduct.dart';
import 'package:flutter/material.dart';

import 'security.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class AppDoubtsArea extends StatefulWidget {
  @override
  _AppDoubtsAreaState createState() => _AppDoubtsAreaState();
}

class _AppDoubtsAreaState extends State<AppDoubtsArea> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: Text('Aplicativo', textAlign: TextAlign.center),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              body: appdoubts()
              ) 
    );
  }

  Widget appdoubts(){
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: (){
//}));
          },
          child:
            appdoubtsButton(name: 'Formas de Pagamento',),
        ),
        GestureDetector(
          onTap: (){
//
          },
          child:
            appdoubtsButton(name: 'Como alterar formas de pagamento?',),
        ),
        GestureDetector(
          onTap: (){
            print('teste');
          },
          child:
            appdoubtsButton(name: 'Como cadastrar cartão?',),
        ),
        GestureDetector(
          onTap: (){
            print('teste');
          },
          child:
            appdoubtsButton(name: 'Como alterar e-mail?',),
        ),
        GestureDetector(
          onTap: (){
            print('teste');
          },
          child:
            appdoubtsButton(name: 'Como alterar nome?',),
        ),
        GestureDetector(
          onTap: (){
            print('teste');
          },
          child:
            appdoubtsButton(name: 'Cancelamento de Serviços',),
        ),
      ],
    );
  }

  Widget appdoubtsButton({name: ' '}){
      return 
          Container(
            width: double.infinity,
            height: 65,
            margin: EdgeInsets.all(5),
              decoration:
                BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: const BorderRadius.all(const Radius.circular(10)),
              ),
            child: 
              Center(
                child: 
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(name),
                          Icon(Icons.arrow_forward_ios, color: Colors.grey,)
                        ],
                      )
                  )
              )
          );
  }
}