import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internship_project_2/DrawerScreen/selectSchedule.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../MyHomePage.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var widtht = MediaQuery.of(context).size.width;
    DateTime selectedDate = DateTime.now();
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => selectSchedule()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => MyHomePage()));
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        title: Text(
          'સેડ્યુલ',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          Row(
            children: [
              SizedBox(
                width: widtht * 0.08,
              ),
              Container(
                  child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: height * 0.05,
                  width: widtht * 0.86,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: Center(
                    child: Text(
                      'અપકમિંગ સેડ્યુલ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
