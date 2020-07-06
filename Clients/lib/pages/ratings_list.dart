import 'package:MyPersonal/components/rating_card.dart';
import 'package:MyPersonal/models/rating_model.dart';
import 'package:MyPersonal/models/trainer_model.dart';
import 'package:MyPersonal/services/rating_service.dart';
import 'package:MyPersonal/utils/colors.dart';
import 'package:MyPersonal/utils/load_screen.dart';
import 'package:flutter/material.dart';

class RatingsList extends StatefulWidget {
  final TrainerModel trainer;

  const RatingsList({Key key, @required this.trainer}) : super(key: key);
  @override
  _RatingsListState createState() => _RatingsListState();
}

class _RatingsListState extends State<RatingsList> {
  List<RatingModel> _ratings = [];
  final rservice = RatingService();

  @override
  void initState() {
    super.initState();
    _loadRatings();
  }

  _loadRatings() async {
    final _trainer = widget.trainer;
    final list = await rservice.getRatings(_trainer.uid);
    setState(() {
      _ratings = list;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Avaliações do Personal', textAlign: TextAlign.center),
            centerTitle: true,
            backgroundColor: mainBlack),
        backgroundColor: mainGreen,
        body: _ratings == null
            ? normalLoad()
            : Container(
                child: ListView(
                  children: _ratings.map((r) {
                    return RatingCard(
                      rating: r,
                      // clickCard: () => _goToFullRating(r),
                    );
                  }).toList(),
                ),
              ));
  }
}
