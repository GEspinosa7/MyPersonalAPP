import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class SecurityArea extends StatefulWidget {
  @override
  _SecurityAreaState createState() => _SecurityAreaState();
}

class _SecurityAreaState extends State<SecurityArea> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: Text('Segurança', textAlign: TextAlign.center),
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
              body: security()
              ) 
    );
  }

  Widget security(){
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: (){
//;
          },
          child:
            securityButton(name: 'Personal não era o mesmo da foto',),
        ),
        GestureDetector(
          onTap: (){
            print('teste');
          },
          child:
            securityButton(name: 'Fui assaltado',),
        ),
        GestureDetector(
          onTap: (){
            print('teste');
          },
          child:
            securityButton(name: 'Reportar desaparecimento de uma pessoa',),
        ),
      ],
    );
  }

  Widget securityButton({name: ' '}){
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