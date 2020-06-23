import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_personal_personaltrainer/utils/colors.dart';
import 'package:my_personal_personaltrainer/utils/load_screen.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Agenda extends StatefulWidget {
  @override
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  CalendarController _calendarController;
  Map<DateTime,List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  SharedPreferences prefs;
  var _selectedDay;



  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
    _selectedDay = {};
    initPrefs();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<String,dynamic> encodeMap(Map<DateTime,dynamic> map) {
    Map<String,dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime,dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime,dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text('Sua Agenda', textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              decoration:
                BoxDecoration(
                  color: mainGreen,
                  borderRadius: const BorderRadius.all(const Radius.circular(15)),
                ),
              child: TableCalendar(
                events: _events,
                locale: 'pt_BR',
                initialCalendarFormat: CalendarFormat.month,
                calendarController: _calendarController,
//Styles
// Header
                headerStyle: HeaderStyle(
                  centerHeaderTitle: true,
                  leftChevronIcon: const Icon(
                    Icons.arrow_left,
                    color: Colors.black,
                    size: 35,
                  ),
                  titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                  rightChevronIcon: const Icon(
                    Icons.arrow_right,
                    color: Colors.black,
                    size: 35,
                  ),
                  formatButtonDecoration: BoxDecoration(
                    color: mainBlack,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  formatButtonTextStyle: TextStyle(
                    color: mainGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),
                  formatButtonShowsNext: false,
                ),

                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  weekendStyle: TextStyle(
                    color: Colors.red[900],
                    fontWeight: FontWeight.bold
                  )
                ),

//Calendar
                calendarStyle: CalendarStyle(
                  todayColor: Colors.grey,
                  outsideWeekendStyle: TextStyle(
                    color: Colors.red[900],
                    fontWeight: FontWeight.bold
                  ),
                  outsideStyle: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold
                  ),
                  weekendStyle: TextStyle(
                    color: mainBlack,
                    fontWeight: FontWeight.bold
                  ),
                  todayStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: mainBlack
                  ),
                  selectedColor: Colors.white,
                  selectedStyle: TextStyle(
                    color: mainBlack
                  )
                ),

// functionalities

                onDaySelected: (date, events){
                  setState(() {
                    _selectedEvents = events;
                    _selectedDay = date;
                  });
                },
              )
            ),
            ..._selectedEvents.map((e) => SingleChildScrollView(
              // title: Text(e),
              child: Column(
                children: [
                  events(title: _selectedDay.toString(), event: e)
                ]
              )
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.fiber_new),
        onPressed: _showAlertDialog,
      ),
    );
  }

  _showAlertDialog(){
    showDialog(context: context,
    builder: (context) => AlertDialog(
      content: TextField(
          controller: _eventController,
      ),
      actions: <Widget>[
        FlatButton(
        child: Text('Adicionar Evento'),
        onPressed: (){
          if (_eventController.text.isEmpty) return;
          if (_events[_calendarController.selectedDay] != null ) {
            _events[_calendarController.selectedDay].add(_eventController.text);
          }else{
            _events[_calendarController.selectedDay] = [_eventController.text];
          }
          prefs.setString("events", json.encode(encodeMap(_events)));
          _eventController.clear();
          Navigator.pop(context);
        }, 
        )
      ],
    )
    );
    setState(() {
      _selectedEvents = _events[_calendarController.selectedDay];
    });
  }

  Widget events({title: ' ', event: 'evento sem nome'}){
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      // height: 90,
      decoration:
        BoxDecoration(
          color: mainGreen,
          borderRadius: const BorderRadius.all(const Radius.circular(15)),
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title, style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold),),
          Center(child: Text(event, style: TextStyle(color: mainBlack, fontSize: 18, fontWeight: FontWeight.bold)))
        ],
      )
    );
  }
}