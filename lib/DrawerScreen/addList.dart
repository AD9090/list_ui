import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../MyHomePage.dart';
import 'package:internship_project_2/DrawerScreen/user_model.dart';

import 'list_model.dart';

class addList extends StatefulWidget {
  const addList({Key? key}) : super(key: key);

  @override
  State<addList> createState() => _addListState();
}

class _addListState extends State<addList> {
  void _performSearch(String searchTerm) {
    // Do something with the search term
    print('Searching for: $searchTerm');
  }

  TextEditingController grain = TextEditingController();
  TextEditingController weight = TextEditingController();

  List<ListModel> list = [];
  late ListModel employeeModel;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widtht = MediaQuery.of(context).size.width;
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
          'એપ્લિકેશન લિસ્ટ ઉમેરો',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                SizedBox(
                  width: widtht * 0.1,
                ),
                Container(
                  height: height * 0.05,
                  width: widtht * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.deepPurple, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: TextField(
                    controller: grain,
                    cursorColor: Colors.deepPurple,
                    decoration: InputDecoration(
                      hintText: 'ટેક્સટ',
                      hintStyle: TextStyle(color: Colors.deepPurple),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 10, bottom: 8, top: 0, right: 15),
                    ),
                  ),
                ),
                SizedBox(
                  width: widtht * 0.02,
                ),
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 10),
                  height: height * 0.05,
                  width: widtht * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.deepPurple, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: TextField(
                    controller: weight,
                    cursorColor: Colors.deepPurple,
                    decoration: InputDecoration(
                      hintText: 'વેલ્યુ',
                      hintStyle: TextStyle(color: Colors.deepPurple),
                      // label: Text(' વેલ્યુ',style: TextStyle(color: Colors.deepPurple),),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 10, bottom: 8, top: 0, right: 15),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  width: widtht * 0.02,
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
                      setState(() {
                        employeeModel =
                            ListModel(grain: grain.text, weight: weight.text);
                        list.add(employeeModel);
                        grain.clear();
                        weight.clear();
                      });
                    },
                    icon: Icon(
                      Icons.arrow_forward_sharp,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.08,
            ),
            for (var user_model in list)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.09,
                    width: widtht * 0.84,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: widtht * 0.08,
                              ),
                              SizedBox(
                                width: widtht * 0.5,
                                child: Text(
                                  '${user_model.grain} ',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: widtht * 0.1,
                                child: Text(
                                  '${user_model.weight}',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: widtht * 0.08,
                              ),
                            ],
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: height * 0.12,
                  )
                ],
              ),
            SizedBox(
              height: height * 0.1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          user_model.lists.add(list);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => MyHomePage()));
        },
        label: const Text('Finish'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
