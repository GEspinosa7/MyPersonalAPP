import 'package:flutter/material.dart';

import 'createA.dart';
import 'login.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class StartPage extends StatelessWidget {
  @override
Widget build(BuildContext context) {
			return Scaffold(
				appBar: AppBar (
				        title: Text('MyPersonal', textAlign: TextAlign.center),
				        centerTitle: true,
				        backgroundColor: Color.fromARGB(255, 18, 32, 47),
		      	),
		      	body: Center (
                child: Column (

                  mainAxisAlignment: MainAxisAlignment.center,
		      		children: [
      		            FlatButton(
                        child: Text("Login",style: TextStyle(fontSize: 20.0),),
                        color: Colors.blue,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(10.0),
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }))
                      ),

      		            FlatButton(
                      child: Text("Criar Conta",style: TextStyle(fontSize: 20.0),),
      						    color: Colors.green,
              				textColor: Colors.white,
              				padding: EdgeInsets.all(10.0),
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return CreateAcPage();
                        }))
        				),
		      		]
				)
           ));
		}
	}