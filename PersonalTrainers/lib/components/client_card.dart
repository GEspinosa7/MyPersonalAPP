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
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
        padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          color: mainBlack,
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(const Radius.circular(30)),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: mainBlack,
                border: Border.all(color: mainBlack),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(100)),
              ),
              child: ClipRRect(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(100)),
                  child: Image.asset('assets/img/perfil_fake.jpg',
                      width: 90, height: 90))),
          Text(
            client.name + ' ' + client.lastname,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}
