import 'package:MyPersonal/components/trainer_card.dart';
import 'package:MyPersonal/models/client_profile_model.dart';
import 'package:MyPersonal/models/trainer_model.dart';
import 'package:MyPersonal/pages/trainer_profile.dart';
import 'package:MyPersonal/services/client_profile_service.dart';
import 'package:MyPersonal/services/trainer_service.dart';
import 'package:MyPersonal/utils/colors.dart';
import 'package:MyPersonal/utils/load_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TrainerListPage extends StatefulWidget {
  @override
  _TrainerListPageState createState() => _TrainerListPageState();
}

class _TrainerListPageState extends State<TrainerListPage> {
  ClientModel clientProfile;
  final cservice = ClientService();
  final _auth = FirebaseAuth.instance;
   List<TrainerModel> _trainers = [];
  final service = TrainerService();

  @override
  void initState() {
    super.initState();
      _auth.currentUser().then((user) {
        _loadClientProfile();
        _loadTrainers();
      });
  }
    _loadClientProfile() async {
    final _clientUser = await _auth.currentUser();
    final resp = await cservice.getClientProfile(_clientUser.uid);
    setState(() {
      clientProfile = resp;
    });
  }

 _loadTrainers() async {
    final list = await service.getTrainers();
    setState(() {
      _trainers = list;
    });
  }

  _goToTrainerProfile(TrainerModel trainer) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return TrainerProfile(
        trainer: trainer,
      );
    }));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
          title: Text('Personais Cadastrados', textAlign: TextAlign.center),
          centerTitle: true,
          backgroundColor: mainBlack
      ),
      backgroundColor: mainGreen,
      body: _trainers == null ? normalLoad() :Container(
        child: ListView(
          children: _trainers.map((t) {
            return TrainerCard(
                trainer: t,
                clickCard: () => _goToTrainerProfile(t),
            );
          }).toList(),
        ),
      ),
    );
  }
}