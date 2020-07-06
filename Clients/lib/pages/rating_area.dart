import 'package:MyPersonal/models/rating_model.dart';
import 'package:MyPersonal/models/trainer_model.dart';
import 'package:MyPersonal/pages/my_personal_trainer_profile.dart';
import 'package:MyPersonal/services/rating_service.dart';
import 'package:MyPersonal/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingArea extends StatefulWidget {
  final int trainerId;
  final String clientUid;

  const RatingArea({Key key, @required this.trainerId, this.clientUid})
      : super(key: key);

  @override
  _RatingAreaState createState() => _RatingAreaState();
}

class _RatingAreaState extends State<RatingArea> {
  final _formKey = GlobalKey<FormState>();
  var _rating = RatingModel();
  final _rService = RatingService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainBlack,
        appBar: AppBar(
            title: Text(
              'Avalicação',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: mainGreen),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: mainBlack,
                        border: Border.all(color: Colors.white),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(15)),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Dê sua nota',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SmoothStarRating(
                            starCount: 5,
                            rating: 0.0,
                            size: 40.0,
                            defaultIconData: Icons.star_border,
                            filledIconData: Icons.star,
                            color: Colors.yellow[200],
                            borderColor: Colors.yellow[200],
                            spacing: 2.0,
                            allowHalfRating: true,
                            onRated: (value) {
                              _rating.ratingValue = value;
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: mainBlack,
                          border: Border.all(color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(const Radius.circular(15)),
                        ),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (value) => _rating.textRating = value,
                              decoration: InputDecoration(
                                  labelText: 'Breve Comentário'),
                              maxLength: 35,
                              style: TextStyle(fontSize: 20),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              onSaved: (value) => _rating.fullRating = value,
                              decoration: InputDecoration(
                                  labelText: 'Avaliação Completa'),
                              maxLines: 8,
                              maxLength: 300,
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        )),
                    RaisedButton(
                      color: mainGreen,
                      // onPressed: () {
                      //   print(widget.clientUid);
                      //   print(widget.trainerId);
                      // },
                      onPressed: _saveRating,
                      // onPressed: () {
                      //   print(_rating.ratingValue);
                      //   print(_rating.textRating);
                      //   print(_rating.fullRating);
                      // },
                      splashColor: Colors.blueGrey,
                      child: Text(
                        'Avaliar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  _saveRating() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _rating.trainerId = widget.trainerId;
      final client = widget.clientUid;
      try {
        final rating = await _rService.createRating(_rating, client);
        // print(_client.uid);
        print(rating.id);
        print("Treinador:");
        print(rating.trainerId);
        print("Client:");
        print(rating.clientId);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MyTainerProfile()));
      } catch (e) {
        print(e);
      }
    }
  }
}
