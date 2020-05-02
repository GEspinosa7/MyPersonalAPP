import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(PersonalListPage());
}

class PersonalListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Personais Cadastrados",
          style: TextStyle(fontSize: 20.0),
        ),
        personal(),
        personal(),
        personal(),
      ],
    );
  }

  Widget personal() {
    return Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(10)),
              ),
        height: 100,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(children: [
              Container(
                  decoration: BoxDecoration(
                border: Border.all(width: 25, color: Colors.black38),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(100)),
              )),
              Text('Nome')
            ]),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Avaliação'), Text('5,5')]),
          ]),
        ));
  }
}
