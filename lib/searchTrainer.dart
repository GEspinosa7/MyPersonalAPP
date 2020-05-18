import 'package:MyPersonal/start.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'trainerProfileA.dart';
import 'trainerProfileB.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class ListTrainer  extends StatefulWidget {
  @override
  _ListTrainerState createState() => _ListTrainerState(); 
}

class _ListTrainerState extends State<ListTrainer> {

    //CONSULTAR API FAKE
    var trainers = [];

    @override 
    void initState(){
      super.initState();
      
      Dio().get('http://www.mocky.io/v2/5eb19f5c3200000f4528f891').then((resp) {
        
        setState(() {
          trainers = resp.data;
        });
    
      });

    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personais Cadastrados', textAlign: TextAlign.center),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) { return StartPage();}));
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: 
            trainerList()
        )
      )
    );
  }

  Widget trainerList(){
    return Center (
      child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children : trainers.map((trainer){
              return Column (
                children: [
                  new GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {return TrainerBProfile();}));
                    },
                    child:
                      Container (
                        margin: EdgeInsets.all(20),
                        height: 150,
                        width: double.infinity,
                        decoration:
                          BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: const BorderRadius.all(const Radius.circular(10)),
                          ),  
                        child:
                          Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child:
                              Row (
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column (
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        decoration:
                                          BoxDecoration(
                                            border: Border.all(color: Colors.green),
                                            borderRadius: const BorderRadius.all(const Radius.circular(100)),
                                          ), 
                                        child:
                                          Center (
                                            child:
                                              ClipRRect(
                                                borderRadius: const BorderRadius.all(const Radius.circular(100)),
                                                child: Image.network(trainer['profile_picture'], width: 70, height: 70))
                                          )
                                      ),
                                      Row(
                                        children: [
                                          Text(trainer['firstname'] + ' '),
                                          
                                          Divider(),

                                          Text(trainer['lastname']),
                                        ],
                                      )
                                    ]
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:[
                                      Text('Avaliação'),
                                      
                                      Divider(),
                                      
                                      Text('${trainer['avaliation']}/5.0'),
                                    ]
                                  )
                                ]
                              ),
                          )
                      )     
                  )          
                ],
              );
            }).toList()
        )
    );
  }
}