import 'package:flutter/material.dart';
import 'createA.dart';
import 'login.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class StartPage extends StatefulWidget {
  @override 
  _StartPageState createState() => _StartPageState(); 
}

class _StartPageState extends State<StartPage> {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home:
       Scaffold(
				appBar: AppBar (
				          title: Text('MyPersonal', textAlign: TextAlign.center),
				          centerTitle: true,
				          backgroundColor: Color.fromARGB(255, 18, 32, 47),
        ),
        body: 
            Padding(
              padding: EdgeInsets.all(60),
              child:
                Center (
                  child: 
                    Column (
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
		      		        children: [
                        Center(                      
                          child:
                            Container(
                              height: 100,
                              width: 100,
                              child: Image.asset('assets/img/logo.png')
                            )
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ButtonTheme(
                            height: 50,
                            child :
                              FlatButton(
                                child: Text("Login",style: TextStyle(fontSize: 20.0),),
                                color: Colors.blue,
                                textColor: Colors.white,
                                padding: EdgeInsets.all(10.0),
                                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) {return LoginPage();}))
                              ) 
                            ),
                            
                            Divider(),
                            
                            ButtonTheme(
                              height: 50,
                              child:
                              FlatButton(
                                child: Text("Nova Conta",style: TextStyle(fontSize: 20.0),),
                                color: Colors.green,
                                textColor: Colors.white,
                                padding: EdgeInsets.all(10.0),
                                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) {return CreateAcPage();}))
                              )
                            ),
                          ]
                        )
                      ]
				            )
                )
            )
      )
    );
  }
}