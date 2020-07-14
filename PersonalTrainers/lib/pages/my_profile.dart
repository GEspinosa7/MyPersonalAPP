import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/models/rating_model.dart';
import 'package:my_personal_personaltrainer/models/trainer_model.dart';
import 'package:my_personal_personaltrainer/pages/rating_list.dart';
import 'package:my_personal_personaltrainer/services/rating_service.dart';
import 'package:my_personal_personaltrainer/services/trainer_service.dart';
import 'package:my_personal_personaltrainer/utils/colors.dart';
import 'package:my_personal_personaltrainer/utils/load_screen.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TrainerModel trainerProfile;
  final service = TrainerService();
  final rservice = RatingService();
  final _auth = FirebaseAuth.instance;
  List<RatingModel> _ratings = [];

  @override
  void initState() {
    super.initState();
    _auth.currentUser().then((user) async {
      await _loadTrainerProfile();
      _loadRatings();
    });
  }

  _loadTrainerProfile() async {
    final _trainerUser = await _auth.currentUser();
    final resp = await service.getTrainerProfile(_trainerUser.uid);
    setState(() {
      trainerProfile = resp;
    });
  }

  _loadRatings() async {
    final list = await rservice.getRatings(trainerProfile.uid);
    setState(() {
      _ratings = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return trainerProfile == null
        ? normalLoad()
        : Scaffold(
            appBar: AppBar(
              title: Text('Meu Perfil', textAlign: TextAlign.center),
              centerTitle: true,
              backgroundColor: mainBlack,
              // actions: [
              //   IconButton(
              //     icon: Icon(Icons.edit),
              //     onPressed: () {
              //       // Navigator.pop(context);
              //     },
              //   )
              // ],
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: mainGreen,
                                  border: Border.all(color: mainGreen),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(100)),
                                ),
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        const Radius.circular(100)),
                                    child: Image.asset('assets/img/me_fake.jpg',
                                        width: 100, height: 100))),
                            Text(
                              trainerProfile.name +
                                  " " +
                                  trainerProfile.lastname,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              "Valor dos Serviços: RS " + trainerProfile.price,
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                          width: double.infinity,
                          height: 70,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: mainGreen,
                            border: Border.all(color: Colors.black),
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(15)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    'Tempo de Profissão',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: mainBlack,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // Text(
                                  //   'Idade',
                                  //   style: TextStyle(
                                  //       fontSize: 18,
                                  //       color: mainBlack,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    trainerProfile.timeActing,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  // Text(
                                  //   trainerProfile.birthDate.toString(),
                                  //   style: TextStyle(fontSize: 18),
                                  // ),
                                ],
                              )
                            ],
                          )),
                      profissionalDatas(
                          title: 'Qualificações',
                          result: trainerProfile.qualifications),
                      profissionalDatas(
                          title: 'Disponibilidade Atual',
                          result: trainerProfile.availability),
                      Divider(),
                      _ratings.length == 0 ? noRating() : yesRating(),
                    ]),
              ),
            ));
  }

  Widget noRating() {
    return Text('Você ainda não recebeu nenhuma avaliação');
  }

  Widget yesRating() {
    return RaisedButton(
      color: Colors.blue,
      onPressed: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => RatingListPage()));
      },
      splashColor: Colors.blueGrey,
      child: Text(
        'Ver Avaliações',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget profissionalDatas({title: ' ', result: ''}) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: mainGreen,
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(const Radius.circular(15)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            Container(
                child: Text(
              result,
              style: TextStyle(fontSize: 15),
            ))
          ],
        ));
  }
}
