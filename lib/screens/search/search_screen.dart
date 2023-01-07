import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_c7_fri/models/NewsResponse.dart';
import 'package:news_c7_fri/screens/news/news_item.dart';
import 'package:news_c7_fri/shared/network/remote/api_manager.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'SearchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';
  List<Articles> NewsList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Image.asset('assets/images/pattern.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: Size(
                  double.infinity, MediaQuery.of(context).size.height * 0.099),
              child: AppBar(
                backgroundColor: Colors.green,
                centerTitle: true,
                shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                leading: SizedBox(),
                leadingWidth: 0,
                title: Container(
                  height: 50,
                  margin: EdgeInsets.all(20),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        query = value;
                      });
                      /////////////////////////////////////////////////////////////////////////////
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.white)),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: Icon(Icons.search, color: Colors.green),
                        prefixIcon: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close),
                            color: Colors.green),
                        hintText: 'Search Article',
                        hintStyle: TextStyle(color: Colors.green),
                        contentPadding: EdgeInsets.only(top: 10)),
                  ),
                ),
              ),
            ),
            body: ListView.builder(
              itemBuilder: (context, index) => NewsItem(search().elementAt(index)),
              itemCount: search().length,
            ),
          ),
        ],
      ),
    );
  }

  List search() {
    ApiManager.getNews(query: query).then(
      (NewsResponse) {
        NewsList = NewsResponse.articles ?? [];
      },
    ).catchError((catchError) {
      debugPrint('error in api $catchError');
    });
    return NewsList;
  }
}
