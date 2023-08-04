import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:internship_project_2/DrawerScreen/Schedule.dart';
import 'package:internship_project_2/DrawerScreen/addList.dart';
import 'package:internship_project_2/DrawerScreen/viewList.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    DashBoardScreen(),
    SupportScrren(),
    NotificationScreen(),
    SettingsScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Do you want to exit app?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text('No'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text('Yes'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ],
          ));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: _screens[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: onTabTapped,
            unselectedLabelStyle:
                const TextStyle(color: Colors.white, fontSize: 14),
            fixedColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.deepPurpleAccent,
                  size: 28,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.deepPurpleAccent,
                  size: 32,
                ),
                label: 'ડેશબોર્ડ',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.contact_support_outlined,
                  color: Colors.deepPurpleAccent,
                  size: 26,
                ),
                activeIcon: Icon(
                  Icons.contact_support,
                  color: Colors.deepPurpleAccent,
                  size: 30,
                ),
                label: 'સપોર્ટ',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.deepPurpleAccent,
                  size: 26,
                ),
                activeIcon: Icon(
                  Icons.notifications,
                  color: Colors.deepPurpleAccent,
                  size: 30,
                ),
                label: 'નોટિફિકેશન',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined,
                    color: Colors.deepPurpleAccent, size: 26),
                activeIcon: Icon(
                  Icons.settings,
                  color: Colors.deepPurpleAccent,
                  size: 30,
                ),
                label: 'સેટિંગ',
              ),
            ],
          ),
        ),
        onWillPop: () async {
          final shouldPop = await showWarning(context);
          return shouldPop ?? false;
        });
  }
}

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedItemIndex = 0;

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  void _selectDrawerItem(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
    // _closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widtht = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'દર્શન,',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.deepPurpleAccent,
          ),
          onPressed: _openDrawer,
        ),
        actions: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Color.fromRGBO(222, 181, 243, 0.35),
            child: IconButton(
              icon: Icon(
                Icons.notifications_none_rounded,
                color: Colors.deepPurple,
                size: 28,
              ),
              onPressed: () {},
            ),
          ),
          CircleAvatar(
            radius: 6,
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(
                Icons.notifications_none_rounded,
                color: Colors.white,
                size: 6,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      drawer: Drawer(
        width: widtht * 0.5,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.deepPurpleAccent,
                    ),
                    onPressed: _closeDrawer,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home_rounded,
                color: _selectedItemIndex == 0
                    ? Colors.deepPurpleAccent // Selected item color
                    : null,
              ),
              title: Text(
                'ડેશબોર્ડ',
                style: TextStyle(
                  color: _selectedItemIndex == 0
                      ? Colors.deepPurpleAccent // Selected item color
                      : null,
                ),
              ),
              onTap: () {
                // Add your logic here for item 1
                _selectDrawerItem(0);
                _closeDrawer();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => MyHomePage()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.add_box_outlined,
                color: _selectedItemIndex == 1
                    ? Colors.deepPurpleAccent // Selected item color
                    : null,
              ),
              title: Text(
                'લિસ્ટ ઉમેરો',
                style: TextStyle(
                  color: _selectedItemIndex == 1
                      ? Colors.deepPurpleAccent // Selected item color
                      : null,
                ),
              ),
              onTap: () {
                // Add your logic here for item 1
                _selectDrawerItem(1);
                // _closeDrawer();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => addList()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.view_list_rounded,
                color: _selectedItemIndex == 2
                    ? Colors.deepPurpleAccent // Selected item color
                    : null,
              ),
              title: Text(
                'વ્યૂ લિસ્ટ',
                style: TextStyle(
                  color: _selectedItemIndex == 2
                      ? Colors.deepPurpleAccent // Selected item color
                      : null,
                ),
              ),
              onTap: () {
                // Add your logic here for item 1
                _selectDrawerItem(2);
                _closeDrawer();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => viewList()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_month_outlined,
                color: _selectedItemIndex == 3
                    ? Colors.deepPurpleAccent // Selected item color
                    : null,
              ),
              title: Text(
                'સેડ્યુલ',
                style: TextStyle(
                  color: _selectedItemIndex == 3
                      ? Colors.deepPurpleAccent // Selected item color
                      : null,
                ),
              ),
              onTap: () {
                // Add your logic here for item 1
                _selectDrawerItem(3);
                _closeDrawer();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Schedule()));
              },
            ),
            SizedBox(
              height: height * 0.49,
            ),
            ListTile(
              leading: Icon(
                Icons.logout_rounded,
                color: _selectedItemIndex == 4
                    ? Colors.deepPurpleAccent // Selected item color
                    : null,
              ),
              title: Text(
                'લોગ આઉટ',
                style: TextStyle(
                  color: _selectedItemIndex == 4
                      ? Colors.deepPurpleAccent // Selected item color
                      : null,
                ),
              ),
              onTap: () {
                // Add your logic here for item 1
                _selectDrawerItem(4);
                _closeDrawer();
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            children: [
              SizedBox(
                width: widtht * 0.08,
              ),
              Text(
                'તમે આજે શું કરવા માંગો છો...?',
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            children: [
              SizedBox(
                width: widtht * 0.075,
              ),
              Container(
                  child: GestureDetector(
                onTap: () {
                  //add functions of this button here
                },
                child: Container(
                  height: height * 0.13,
                  width: widtht * 0.86,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(61, 56, 195, 0.20),
                        Color.fromRGBO(220, 220, 255, 0.2),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widtht * 0.03,
                          ),
                          Icon(
                            Icons.calendar_month_outlined,
                            size: 35,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widtht * 0.04,
                          ),
                          Text(
                            'સેડ્યુલ રીમાઇન્ડર',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            children: [
              SizedBox(
                width: widtht * 0.075,
              ),
              Container(
                  child: GestureDetector(
                onTap: () {
                  //add functions of this button here
                },
                child: Container(
                  height: height * 0.13,
                  width: widtht * 0.86,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(0, 255, 51, 0.2),
                        Color.fromRGBO(205, 255, 218, 0.2),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widtht * 0.03,
                          ),
                          Icon(
                            Icons.sticky_note_2_outlined,
                            size: 35,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widtht * 0.04,
                          ),
                          Text(
                            'એપ્લિકેશન લિસ્ટ',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            children: [
              SizedBox(
                width: widtht * 0.075,
              ),
              Container(
                  child: GestureDetector(
                onTap: () {
                  //add functions of this button here
                },
                child: Container(
                  height: height * 0.13,
                  width: widtht * 0.86,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(0, 70, 255, 0.2),
                        Color.fromRGBO(189, 208, 255, 0.2),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widtht * 0.03,
                          ),
                          Icon(
                            Icons.edit_note_rounded,
                            size: 35,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widtht * 0.04,
                          ),
                          Text(
                            'એડિટ લિસ્ટ',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            children: [
              SizedBox(
                width: widtht * 0.075,
              ),
              Container(
                  child: GestureDetector(
                onTap: () {
                  //add functions of this button here
                },
                child: Container(
                  height: height * 0.13,
                  width: widtht * 0.86,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(9, 255, 0, 0.2),
                        Color.fromRGBO(195, 255, 216, 0.2),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widtht * 0.03,
                          ),
                          Icon(
                            Icons.note_outlined,
                            size: 35,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widtht * 0.04,
                          ),
                          Text(
                            'વ્યૂ લિસ્ટ',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            children: [
              SizedBox(
                width: widtht * 0.075,
              ),
              Container(
                  child: GestureDetector(
                onTap: () {
                  //add functions of this button here
                },
                child: Container(
                  height: height * 0.13,
                  width: widtht * 0.86,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(8, 62, 199, 0.2),
                        Color.fromRGBO(213, 224, 255, 0.2),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widtht * 0.03,
                          ),
                          Icon(
                            Icons.list_alt_rounded,
                            size: 35,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widtht * 0.04,
                          ),
                          Text(
                            'લિસ્ટ ની ડિટેઇલ',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
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

class SupportScrren extends StatefulWidget {
  const SupportScrren({Key? key}) : super(key: key);

  @override
  State<SupportScrren> createState() => _SupportScrrenState();
}

class _SupportScrrenState extends State<SupportScrren> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Support'));
  }
}

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Notification'));
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Setting'));
  }
}
