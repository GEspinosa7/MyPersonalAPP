import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/models/rating_model.dart';
import 'package:my_personal_personaltrainer/utils/colors.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingCard extends StatelessWidget {
  final RatingModel rating;
  final Function() clickCard;

  const RatingCard({Key key, this.rating, this.clickCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: clickCard,
        child: Container(
          margin: EdgeInsets.fromLTRB(25, 20, 25, 5),
          padding: EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            color: mainGreen,
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(const Radius.circular(15)),
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          width: 85,
                          height: 85,
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: mainBlack,
                            border: Border.all(color: Colors.white),
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(100)),
                          ),
                          child: Center(child: Icon(Icons.person)
                              // ClipRRect(
                              //   borderRadius: const BorderRadius.all(const Radius.circular(100)),
                              //   child: Image.asset('assets/img/indice.jpeg', width: 85, height: 85)
                              // )
                              )),
                      Text(
                        rating.client.name + ' ' + rating.client.lastname,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Nota: ' + rating.ratingValue.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      SmoothStarRating(
                          isReadOnly: true,
                          starCount: 5,
                          rating: rating.ratingValue,
                          size: 28.0,
                          defaultIconData: Icons.star_border,
                          filledIconData: Icons.star,
                          color: Colors.yellow[200],
                          borderColor: Colors.yellow[200],
                          spacing: 2.0),
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  '"${rating.textRating}"',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
              ),
              Text(
                'Toque no card para visualziar a avaliação completa',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: mainBlack,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
