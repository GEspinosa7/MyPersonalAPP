import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/models/trainer_model.dart';
import 'package:my_personal_personaltrainer/services/trainer_service.dart';
import 'package:my_personal_personaltrainer/utils/colors.dart';
import 'package:my_personal_personaltrainer/utils/load_screen.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class ProfileConfigs extends StatefulWidget {
  @override
  _ProfileConfigsState createState() => _ProfileConfigsState();
}

class _ProfileConfigsState extends State<ProfileConfigs> {
  TrainerModel trainerProfile;
  final service = TrainerService();
  final _auth = FirebaseAuth.instance;


  @override
  void initState() {
    super.initState();
      _auth.currentUser().then((user) {
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

    return Scaffold(
      appBar: AppBar(
      title: Text('Configurações do Perfil'),
      centerTitle: true,
      backgroundColor: mainBlack,
      ),
              body: profile()
    );
  }

  Widget profile(){
    return trainerProfile == null ? normalLoad() : Column(
      children: <Widget>[
        Container(
          height: 250,
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
          decoration:
            BoxDecoration(
              color: mainGreen,
              border: Border.all(color: mainGreen),
              borderRadius: const BorderRadius.all(const Radius.circular(10)),
            ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration:
                    BoxDecoration(
                      border: Border.all(color: mainBlack),
                      borderRadius: const BorderRadius.all(const Radius.circular(100)),
                    ), 
                  child:
                    Center (
                      child:
                        Icon(Icons.add_a_photo)
                        // ClipRRect(
                        //   borderRadius: const BorderRadius.all(const Radius.circular(100)),
                        //   // child: Image.asset('assets/img/eu.jpg', width: 100, height: 100)
                        // )
                    )
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Adicionar/Alterar imagem de perfil', style: TextStyle(fontSize: 17, color: mainBlack,),),
                      Icon(Icons.arrow_forward_ios, color: mainBlack, size: 17,)
                    ],
                  )
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    trainerProfile.name + " " + trainerProfile.lastname, 
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),  
                  ),
                )
              ],
            ),
          )
        ),
        Divider(),
        GestureDetector(
          onTap: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) {return PhoneNumber();}));
          },
          child: profileAction(name: 'Adicionar/Alterar Telefone', bgColor: mainGreen)
        ),
        GestureDetector(
          onTap: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) {return ChangeEmail();}));
          },
          child: profileAction(name: 'Alterar E-mail', bgColor: mainGreen)
        ),
        GestureDetector(
          onTap: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) {return ChangePass();}));
          },
          child: profileAction(name: 'Alterar Senha', bgColor: mainGreen)
        ),
        GestureDetector(
          onTap: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) {return DeleteAccount();}));
          },
          child: profileAction(name: 'Excluir minha conta', nameColor: Colors.red, iconColor: Colors.red[900], borderColor: Colors.red, bgColor: mainBlack)
        ),      
      ],
    );
  }

  Widget profileAction({
    name: ' ',
    nameColor: Colors.black,
    iconColor: Colors.black,
    bgColor: Colors.green,
    borderColor: Colors.green
  }){
      return 
          Container(
            width: double.infinity,
            height: 40,
            margin: EdgeInsets.all(10),
              decoration:
                BoxDecoration(
                  color: bgColor,
                  border: Border.all(color: borderColor),
                  borderRadius: const BorderRadius.all(const Radius.circular(10)),
              ),
            child: 
              Center(
                child: 
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(name, style: TextStyle(color: nameColor, fontSize: 14, fontWeight: FontWeight.bold),),
                          Icon(Icons.arrow_forward_ios, color: iconColor, size: 15)
                        ],
                      )
                  )
              )
          );
  }
}