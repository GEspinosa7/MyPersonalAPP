import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/models/client_model.dart';
import 'package:my_personal_personaltrainer/utils/colors.dart';

class ClientCard extends StatelessWidget {
  final ClientModel client;
  final Function() clickCard;

  const ClientCard({Key key, this.client, this.clickCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickCard,
      child: Container (
        margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: mainGreen,
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(const Radius.circular(15)),
        ),
            child: Row (
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    margin: EdgeInsets.only(right: 40),
                    decoration:
                      BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: const BorderRadius.all(const Radius.circular(100)),
                      ), 
                    child: Center (
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(const Radius.circular(100)),
                          // child: Image.network(client['profile_picture'], width: 70, height: 70))
                          child: Icon(Icons.person)
                        )
                    )
                  ),
                  Text(client.name + ' ' + client.lastname, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                ]
            ),
      ),
    );
    
  }
}