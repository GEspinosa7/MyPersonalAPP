import 'package:MyPersonal/models/rating_model.dart';
import 'package:MyPersonal/models/trainer_model.dart';
import 'package:MyPersonal/services/rating_service.dart';
import 'package:MyPersonal/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FullRatingPage extends StatefulWidget {
  final RatingModel rating;

  const FullRatingPage({Key key, @required this.rating}) : super(key: key);
  @override
  _FullRatingPageState createState() => _FullRatingPageState();
}

class _FullRatingPageState extends State<FullRatingPage> {
  final rservice = RatingService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainGreen,
      appBar: AppBar(
          title: Text('Avaliação Completa', textAlign: TextAlign.center),
          centerTitle: true,
          backgroundColor: mainBlack),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: mainBlack,
                      border: Border.all(color: mainBlack),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(100)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              color: mainBlack,
                              border: Border.all(color: Colors.white),
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(100)),
                            ),
                            child: Center(child: Icon(Icons.person)
                                // ClipRRect(
                                //   borderRadius: const BorderRadius.all(const Radius.circular(100)),
                                //   child: Image.asset('assets/img/indice.jpeg', width: 90, height: 90)
                                // )
                                )),
                        Text(
                          widget.rating.client.name +
                              ' ' +
                              widget.rating.client.lastname,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: mainBlack,
                border: Border.all(color: mainBlack),
                borderRadius: const BorderRadius.all(const Radius.circular(15)),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'Nota: ' + widget.rating.ratingValue.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  SmoothStarRating(
                      // isReadOnly: true,
                      starCount: 5,
                      rating: widget.rating.ratingValue,
                      size: 28.0,
                      defaultIconData: Icons.star_border,
                      filledIconData: Icons.star,
                      color: Colors.yellow[200],
                      borderColor: Colors.yellow[200],
                      spacing: 2.0),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: mainBlack,
                  border: Border.all(color: mainBlack),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(15)),
                ),
                child: Text(
                  widget.rating.textRating,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                )),
            Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: mainBlack,
                  border: Border.all(color: mainBlack),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(15)),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    widget.rating.fullRating,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
