import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/models/trainer_model.dart';
import 'package:my_personal_personaltrainer/pages/agenda.dart';
import 'package:my_personal_personaltrainer/pages/avaliations_area.dart';
import 'package:my_personal_personaltrainer/pages/configurations.dart';
import 'package:my_personal_personaltrainer/pages/my_profile.dart';
import 'package:my_personal_personaltrainer/pages/profile_configurations.dart';
import 'package:my_personal_personaltrainer/pages/start.dart';
import 'package:my_personal_personaltrainer/services/trainer_service.dart';
import 'package:my_personal_personaltrainer/utils/colors.dart';
import 'package:my_personal_personaltrainer/utils/load_screen.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TrainerModel trainerProfile;
  final service = TrainerService();

  final _auth = FirebaseAuth.instance;
  var _userEmail = '';


  @override
  void initState() {
    super.initState();
      _auth.currentUser().then((user) {
        setState(() =>_userEmail = user.email);
        _loadTrainerProfile();
      });
  }

  _loadTrainerProfile() async {
    final _trainerUser = await _auth.currentUser();
    final resp = await service.getTrainerProfile(_trainerUser.uid);
    setState(() {
      trainerProfile = resp;
    });
  }



  @override
  Widget build(BuildContext context) {
    return trainerProfile == null ? normalLoad() : Scaffold(
				appBar: AppBar (
          title: Text('Home', textAlign: TextAlign.center),
          centerTitle: true,
          backgroundColor: mainBlack
        ),
        body: home(),
        backgroundColor: mainGreen,
         drawer: Drawer(
              child: Container(
                color: mainBlack,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: mainGreen,
                      ),
                      child: 
                        Center(
                          child: 
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {return MyProfile();}));
                                  },
                                  child: 
                                    Container(
                                      width: 100,
                                      height: 100,
                                      margin: EdgeInsets.only(bottom: 10),
                                      decoration:
                                        BoxDecoration(
                                          color: mainBlack,
                                          border: Border.all(color: mainGreen),
                                          borderRadius: const BorderRadius.all(const Radius.circular(100)),
                                        ), 
                                      child:
                                        Center (
                                          child:
                                            Icon(Icons.add_a_photo)
                                            // ClipRRect(
                                            //   borderRadius: const BorderRadius.all(const Radius.circular(100)),
                                            //   child: Image.asset('assets/img/indice.jpeg', width: 100, height: 100)
                                            // )
                                        )
                                    ),
                                ),
                                Text(trainerProfile.name + " " + trainerProfile.lastname, style: TextStyle(color: Colors.black),)
                              ],
                            )

                        )
                    ),
                    ListTile(
                      title: Text('Meu Perfil'),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {return MyProfile();}));
                      },
                    ),
                    ListTile(
                      title: Text('Configurações'),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {return ConfigArea();}));
                      },
                    ),
                    ListTile(
                      title: Text('Pagamento'),
                      onTap: () {
                        //  Navigator.push(context, MaterialPageRoute(builder: (context) {return HelpArea();}));
                      },
                    ),
                    ListTile(
                      title: Text('Ajuda'),
                      onTap: () {

                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              )
        )
    );
  }

  Widget home(){
    return Container(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {return Agenda();}));
              },
              child: homeActions(actionName: 'Agenda', provcolor: mainBlack)
            ),
            homeActions(actionName: 'Alunos'),
            homeActions(actionName: 'Treino'),
            homeActions(actionName: 'Mensagens'),
            homeActions(actionName: 'Portifólio'),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {return AvaliationsArea();}));
              },
              child: homeActions(actionName: 'Avaliações', provcolor: Colors.grey)
            ),
          ],
        ),
    );
  }

  Widget homeActions({actionName: 'Bloco', provcolor: Colors.grey }){
    return Container(
      width: 150,
      height: 110,
      margin: EdgeInsets.all(15),
      decoration:
        BoxDecoration(
          color: provcolor,
          border: Border.all(color: mainGreen),
          borderRadius: const BorderRadius.all(const Radius.circular(15)),
      ), 
      child: Center(
        child: Text(actionName, textAlign: TextAlign.center, style: TextStyle(fontSize: 20),) 
      ),
    );
  }
  

  _sair() async {
    _auth.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => StartPage(),
    ));
  }
}