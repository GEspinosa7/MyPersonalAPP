import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: Text('Método de Pagamento', textAlign: TextAlign.center),
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
              body: SingleChildScrollView(
                child:
                  paymentMethods() 
              ) 
            )
    );
  }

  Widget paymentMethods(){
    return Column(
      children: [
        GestureDetector(
        onTap: (){
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {return MyApp();}));
        },
        child: 
          Container(
            width: double.infinity,    
            margin: EdgeInsets.all(20),
            child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  Container(child: Icon(Icons.add)),
                  Column(
                    children: [
                      Text('Adicionar Método de Pagamento', style: TextStyle(fontSize: 18)),
                      Text('Cartões de crédito ou débito/Paypal')
                    ],
                  )
                ]
              )
          )
        ),
      ],
    );
  }
}