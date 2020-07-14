import 'package:MyPersonal/models/trainer_model.dart';
import 'package:MyPersonal/utils/colors.dart';
import 'package:flutter/material.dart';

class TrainerCard extends StatelessWidget {
  final TrainerModel trainer;
  final Function() clickCard;

  const TrainerCard({Key key, this.trainer, this.clickCard}) : super(key: key);

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
                border: Border.all(color: mainGreen),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(100)),
              ),
              child: ClipRRect(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(100)),
                  child: Image.asset('assets/img/perfil_fake.jpg',
                      width: 80, height: 80))),
          Text(
            trainer.name + ' ' + trainer.lastname,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
    // return GestureDetector(
    //   onTap: clickCard,
    //   child: Container(
    //     margin: EdgeInsets.all(15),
    //     height: 150,
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //       color: mainBlack,
    //       border: Border.all(color: Colors.white),
    //       borderRadius: const BorderRadius.all(const Radius.circular(15)),
    //     ),
    //     child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
    //       Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
    //         Container(
    //             height: 95,
    //             width: 95,
    //             decoration: BoxDecoration(
    //               border: Border.all(color: Colors.white),
    //               borderRadius:
    //                   const BorderRadius.all(const Radius.circular(100)),
    //             ),
    //             child: Center(
    //                 child: ClipRRect(
    //                     borderRadius:
    //                         const BorderRadius.all(const Radius.circular(100)),
    //                     // child: Image.network(trainer['profile_picture'], width: 70, height: 70))
    //                     child: Icon(Icons.person)))),
    //         Text(
    //           trainer.name + ' ' + trainer.lastname,
    //           style: TextStyle(fontSize: 18),
    //         )
    //       ]),
    //       Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    //         Text(
    //           'Avaliação',
    //           style: TextStyle(fontSize: 18),
    //         ),
    //         Divider(),
    //         Text(
    //           rating == 0.0 ? "Sem avaliação" : rating.toString(),
    //           style: TextStyle(
    //               fontSize: 15,
    //               fontWeight: FontWeight.bold,
    //               color: Colors.red[100]),
    //         ),
    //         Divider(),
    //         SmoothStarRating(
    //             // isReadOnly: true,
    //             starCount: 5,
    //             rating: rating,
    //             size: 25.0,
    //             defaultIconData: Icons.star_border,
    //             filledIconData: Icons.star,
    //             color: Colors.yellow[200],
    //             borderColor: Colors.yellow[200],
    //             spacing: 2.0)
    //       ])
    //     ]),
    //   ),
    // );
  }
}
