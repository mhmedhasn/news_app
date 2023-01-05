import 'package:flutter/material.dart';
import 'package:news_app/layout/home_layout.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     initialRoute:HomeLayout.routName,
     routes: {
       HomeLayout.routName:(context) => HomeLayout(),

     },
     debugShowCheckedModeBanner: false,

   );
  }

}
