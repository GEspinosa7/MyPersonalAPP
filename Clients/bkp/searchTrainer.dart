import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'models/trainers.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

// API FAKE
const baseUrl = 'http://www.mocky.io';

class ListTrainer  extends StatefulWidget {
  @override
  _ListTrainerState createState() => _ListTrainerState(); 
}

class _ListTrainerState extends State<ListTrainer> {
  List<Trainers> trainers;

    final client = Dio(BaseOptions(baseUrl: baseUrl));

    _getTrainer() async {
      var resp = await client.get('/v2/5eb02a103300002b00c68c3a');

      setState(() {
        trainers = List<Trainers>.from(resp.data.map((r) => Trainers.fromJson(r)));
      });
    }

    @override 
    void initState(){
      super.initState();
      _getTrainer();
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
        ),
      body: _trainers()
    )
    );
  }

  Widget _trainers() {
    return Column(
      children: [
        Expanded(
          child: ListView(children: List<Widget>.from(trainers.map((r) => listItem(r)).toList())),
        )
      ]
    );
  }

  listItem(Trainers trainers) {
    return Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(10)),
              ),
        height: 120,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom:10),
                decoration: BoxDecoration(
                border: Border.all(width: 25, color: Colors.black38),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(100)),
              )),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text (trainers.firstname),
                    Text (trainers.lastname)
                  ],
                )
              )
            ]),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Avaliação'), Text('${trainers.avaliation}/5.0')]),
          ]),
        )
        );
  }
}