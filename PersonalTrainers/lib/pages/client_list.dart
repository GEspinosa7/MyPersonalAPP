import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/components/client_card.dart';
import 'package:my_personal_personaltrainer/models/client_model.dart';
import 'package:my_personal_personaltrainer/models/trainer_model.dart';
import 'package:my_personal_personaltrainer/pages/my_client.dart';
import 'package:my_personal_personaltrainer/services/client_service.dart';
import 'package:my_personal_personaltrainer/services/trainer_service.dart';
import 'package:my_personal_personaltrainer/utils/colors.dart';
import 'package:my_personal_personaltrainer/utils/load_screen.dart';

class ClientListPage extends StatefulWidget {
  @override
  _ClientListPageState createState() => _ClientListPageState();
}

class _ClientListPageState extends State<ClientListPage> {
  TrainerModel trainerProfile;
  final tservice = TrainerService();
  final _auth = FirebaseAuth.instance;
  List<ClientModel> _clients = [];
  final service = ClientService();

  @override
  void initState() {
    super.initState();
    _auth.currentUser().then((user) {
      _loadTrainerProfile();
      _loadClients();
    });
  }

  _loadTrainerProfile() async {
    final _trainerUser = await _auth.currentUser();
    final resp = await tservice.getTrainerProfile(_trainerUser.uid);
    setState(() {
      trainerProfile = resp;
    });
  }

  _loadClients() async {
    final list = await service.getClients();
    setState(() {
      _clients = list;
    });
  }

  _goToClientProfile(ClientModel client) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MyClientProfile(
        client: client,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Meus Alunos', textAlign: TextAlign.center),
            centerTitle: true,
            backgroundColor: mainGreen),
        backgroundColor: mainBlack,
        body: _clients == null
            ? Text('Não há clientes')
            : Container(
                child: ListView(
                  children: _clients.map((c) {
                    return ClientCard(
                      client: c,
                      clickCard: () => _goToClientProfile(c),
                    );
                  }).toList(),
                ),
              ));
  }
}
