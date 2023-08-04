import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../MyHomePage.dart';
import 'package:internship_project_2/DrawerScreen/user_model.dart';

class viewList extends StatefulWidget {
  const viewList({Key? key}) : super(key: key);

  @override
  State<viewList> createState() => _viewListState();
}

class _viewListState extends State<viewList> {
  void _performSearch(String searchTerm) {
    // Do something with the search term
    print('Searching for: $searchTerm');
  }

  int i = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widtht = MediaQuery.of(context).size.width;

    DateTime today = DateTime.now();
    String date = "${today.day}-${today.month}-${today.year}";

    return Scaffold(
        backgroundColor: Colors.white,
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
            'વ્યૂ લિસ્ટ',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                children: [
                  SizedBox(
                    width: widtht * 0.05,
                  ),
                  SearchBar(onSearch: _performSearch),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              ToggleSwitch(
                minWidth: widtht * 0.33,
                minHeight: height * 0.048,
                initialLabelIndex: 1,
                cornerRadius: 10.0,
                radiusStyle: true,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey.withOpacity(0.2),
                inactiveFgColor: Colors.grey,
                totalSwitches: 2,
                labels: ['ઓલ લિસ્ટ', 'પિન કરેલ'],
                activeBgColors: [
                  [Colors.black],
                  [Colors.black]
                ],
                // animationDuration: ,
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
              SizedBox(
                height: height * 0.04,
              ),
              for (var user_model in user_model.lists)
                Column(
                  children: [
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
                            height: height * 0.1,
                            width: widtht * 0.86,
                            decoration: BoxDecoration(
                              color: i % 2 == 0
                                  ? Color.fromRGBO(132, 255, 134, 0.4) // Selected item color
                                  : Color.fromRGBO(128, 166, 255, 0.4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
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
                                    Text('લિસ્ટ  ${i++}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
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
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      size: 15,
                                    ),
                                    Text(
                                      '  $date',
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
                )
            ],
          ),
        ));
  }
}

class SearchBar extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final Function(String) _onSearch;

  SearchBar({required Function(String) onSearch}) : _onSearch = onSearch;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widtht = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          height: height * 0.05,
          width: widtht * 0.83,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.deepPurple, // Border color
              width: 2.0, // Border width
            ),
          ),
          child: TextField(
            controller: _searchController,
            cursorColor: Colors.deepPurple,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.deepPurple),
              // label: Text(' વેલ્યુ',style: TextStyle(color: Colors.deepPurple),),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 10, bottom: 5, top: 4, right: 15),
              prefixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.deepPurple,
                ),
                onPressed: () {
                  _onSearch(_searchController.text);
                },
              ),
            ),
          ),
        ));
  }
}
