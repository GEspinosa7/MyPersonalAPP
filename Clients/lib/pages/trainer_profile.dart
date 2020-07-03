import 'package:MyPersonal/models/client_profile_model.dart';
import 'package:MyPersonal/models/trainer_model.dart';
import 'package:MyPersonal/pages/contract.dart';
import 'package:MyPersonal/services/trainer_service.dart';
import 'package:MyPersonal/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class TrainerProfile extends StatefulWidget {
  final TrainerModel trainer;
  final ClientModel client;

  const TrainerProfile({Key key, @required this.trainer, this.client})
      : super(key: key);

  @override
  _TrainerProfileState createState() => _TrainerProfileState();
}

class _TrainerProfileState extends State<TrainerProfile> {
  final service = TrainerService();

  _goToContractingPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ContractingPage(
        trainerId: widget.trainer.id,
        clientUid: widget.client.uid,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    var rating = 0.0;

    return Scaffold(
      backgroundColor: mainBlack,
      appBar: AppBar(
        title: Text('${widget.trainer.name} ${widget.trainer.lastname}',
            textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: mainGreen,
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
                        child: Center(child: Icon(Icons.person)
                            // ClipRRect(
                            //   borderRadius: const BorderRadius.all(const Radius.circular(100)),
                            //   child: Image.asset('assets/img/indice.jpeg', width: 100, height: 100)
                            // )
                            )),
                    Text(
                      '${widget.trainer.birthDate}',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Valor dos Serviços: R\$ " + "${widget.trainer.price}",
                      style: TextStyle(fontSize: 18),
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
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(15)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'Tempo de Profissão',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "${widget.trainer.timeActing}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      )
                    ],
                  )),
              profissionalDatas(
                  title: 'Qualificações',
                  result: "${widget.trainer.qualifications}"),
              profissionalDatas(
                  title: 'Disponibilidade Atual',
                  result: "${widget.trainer.availability}"),
              Divider(),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    Text(
                      rating == 0.0
                          ? "Ainda não ocorreu nenhuma avaliação"
                          : "Avaliação(Média): " + rating.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SmoothStarRating(
                        starCount: 5,
                        rating: rating,
                        // isReadOnly: true,
                        size: 40.0,
                        defaultIconData: Icons.star_border,
                        filledIconData: Icons.star,
                        color: Colors.yellow[200],
                        borderColor: Colors.yellow[200],
                        spacing: 2.0)
                  ],
                ),
              ),
              rating == 0.0
                  ? Text('')
                  : Container(
                      margin: EdgeInsets.all(10),
                      child: FlatButton(
                          color: mainGreen,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(10.0),
                          onPressed: () {},
                          child: Text("Ver Avaliações",
                              style: TextStyle(fontSize: 20.0))),
                    ),
              Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.blue,
                      onPressed: () {
                        _goToContractingPage();
                      },
                      splashColor: Colors.blueGrey,
                      child: Text(
                        'Contratar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    RaisedButton(
                      color: Colors.transparent,
                      onPressed: () => null,
                      splashColor: Colors.blueGrey,
                      child: Text(
                        'Mensagem',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
