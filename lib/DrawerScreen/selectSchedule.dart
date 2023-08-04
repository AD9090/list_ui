import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internship_project_2/MyHomePage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'Schedule.dart';

class selectSchedule extends StatefulWidget {
  const selectSchedule({Key? key}) : super(key: key);

  @override
  State<selectSchedule> createState() => _selectScheduleState();
}

class _selectScheduleState extends State<selectSchedule> {
  TextEditingController titleOfSchedule = TextEditingController();
  DateTime today = DateTime.now();
  DateTime date = DateTime(2016, 10, 26);
  DateTime time = DateTime(2016, 5, 10, 22, 35);
  DateTime dateTime = DateTime(2016, 8, 3, 17, 45);

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var widtht = MediaQuery.of(context).size.width;
    return WillPopScope(
        child: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              Row(
                children: [
                  SizedBox(
                    width: widtht * 0.1,
                  ),
                  Container(
                    height: height * 0.05,
                    width: widtht * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors.deepPurple, // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                    child: TextField(
                      controller: titleOfSchedule,
                      cursorColor: Colors.deepPurple,
                      decoration: InputDecoration(
                        hintText: 'ટાઇટલ',
                        hintStyle: TextStyle(color: Colors.deepPurple),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 10, bottom: 8, top: 0, right: 15),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widtht * 0.1,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.08,
              ),
              TableCalendar(
                locale: 'en_us',
                headerStyle: HeaderStyle(formatButtonVisible: false),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime.utc(1950, 1, 1),
                lastDay: DateTime.utc(2050, 1, 1),
                onDaySelected: _onDaySelected,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: widtht * 0.05,
                  ),
                  Text(
                    'Time',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: widtht * 0.24,
                  ),
                  CupertinoButton(
                      onPressed: () => _showDialog(
                            CupertinoDatePicker(
                              initialDateTime: time,
                              mode: CupertinoDatePickerMode.time,
                              use24hFormat: true,
                              onDateTimeChanged: (DateTime newTime) {
                                setState(() => time = newTime);
                              },
                            ),
                          ),
                      child: Container(
                        alignment: Alignment.center,
                        height: height * 0.04,
                        width: widtht * 0.2,
                        // color: Colors.grey,
                        decoration: BoxDecoration(
                          // Selected item color
                          color: Colors.grey.withOpacity(0.15),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        child: Text(
                          '${time.hour}:${time.minute}',
                          style: const TextStyle(
                              fontSize: 20.0, color: Colors.black),
                        ),
                      )),
                  ToggleSwitch(
                    minWidth: widtht * 0.12,
                    minHeight: height * 0.03,
                    initialLabelIndex: 1,
                    cornerRadius: 4.0,
                    borderColor: [Colors.grey.withOpacity(0.2)],
                    radiusStyle: true,
                    activeFgColor: Colors.black,
                    inactiveBgColor: Colors.grey.withOpacity(0.1),
                    inactiveFgColor: Colors.black,
                    totalSwitches: 2,
                    labels: ['AM', 'PM'],
                    activeBgColors: [
                      [Colors.white],
                      [Colors.white]
                    ],
                    // animationDuration: ,
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                height: height * 0.05,
                width: height * 0.05,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.black12, // Border color
                    width: 2.0, // Border width
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 4,
                      offset: Offset(4, 4), // Shadow position
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => MyHomePage()));
                  },
                  icon: Icon(
                    Icons.arrow_forward_sharp,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        )),
        onWillPop: () async {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => Schedule()));
          return true;
        });
  }
}
