import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:news_c7_fri/layout/home_layout.dart';
import 'package:news_c7_fri/screens/news/news_details.dart';
import 'package:news_c7_fri/screens/search/search_screen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp( MyApp());
  FlutterNativeSplash.remove();
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeLayout.routeName,
      routes:{
        HomeLayout.routeName:(context) => HomeLayout(),
        NewsDetails.routeName:(context) => NewsDetails(),
        SearchScreen.routeName:(context) => SearchScreen()
      } ,
      debugShowCheckedModeBanner: false,
    );
  }
}

