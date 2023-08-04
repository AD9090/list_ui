
import 'package:flutter/material.dart';
import 'package:internship_project_2/MyHomePage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'MyHomePage',
    routes: {
      'MyHomePage': (context) => MyHomePage(),
      'SupportScreen': (context) => SupportScrren(),

    },
  )
  );
}
