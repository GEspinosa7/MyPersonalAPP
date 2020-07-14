import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/components/rating_card.dart';
import 'package:my_personal_personaltrainer/models/rating_model.dart';
import 'package:my_personal_personaltrainer/models/trainer_model.dart';
import 'package:my_personal_personaltrainer/pages/full_rating.dart';
import 'package:my_personal_personaltrainer/services/rating_service.dart';
import 'package:my_personal_personaltrainer/services/trainer_service.dart';
import 'package:my_personal_personaltrainer/utils/colors.dart';

class RatingListPage extends StatefulWidget {
  @override
  _RatingListPageState createState() => _RatingListPageState();
}

class _RatingListPageState extends State<RatingListPage> {
  TrainerModel trainerProfile;
  final tservice = TrainerService();
  final _auth = FirebaseAuth.instance;
  List<RatingModel> _ratings = [];
  final rservice = RatingService();

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
    final resp = await tservice.getTrainerProfile(_trainerUser.uid);
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

  _goToFullRating(RatingModel rating) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return FullRatingPage(
        rating: rating,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Minhas Avaliações', textAlign: TextAlign.center),
            centerTitle: true,
            backgroundColor: mainGreen),
        backgroundColor: mainBlack,
        body: _ratings.length == 0
            ? noRating()
            : Container(
                child: ListView(
                  children: _ratings.map((r) {
                    return RatingCard(
                      rating: r,
                      clickCard: () => _goToFullRating(r),
                    );
                  }).toList(),
                ),
              ));
  }

  Widget noRating() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.announcement,
            size: 90,
          ),
          Container(
            margin: EdgeInsets.all(20),
            height: 200,
            decoration: BoxDecoration(
              color: mainBlack,
              border: Border.all(color: mainGreen),
              borderRadius: const BorderRadius.all(const Radius.circular(15)),
            ),
            child: Center(
                child: Text(
              'Você ainda não recebeu nenhuma avaliação',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )),
          ),
        ],
      ),
    );
  }
}
