import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/NewsResponse.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'NewsDetails';

  @override
  Widget build(BuildContext context) {
    Articles news = ModalRoute.of(context)?.settings.arguments as Articles;
    return Stack(
      children: [
        Container(
            color: Colors.white,
            child: Image.asset(
              'assets/images/pattern.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            )),
        Container(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: Size(
                  double.infinity, MediaQuery.of(context).size.height * 0.099),
              child: AppBar(
                centerTitle: true,
                shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                title: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text('News App',
                      style: TextStyle(fontWeight: FontWeight.w300)),
                ),
              ),
            ),
            body: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      child: CachedNetworkImage(
                        imageUrl: news.urlToImage ?? '',
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.3,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Text(news.author ?? '',
                        style: TextStyle(
                          color: Color.fromRGBO(121, 130, 139, 100),
                          fontSize: 13,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(news.title ?? '',
                        style: TextStyle(
                          fontSize: 14,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(news.publishedAt ?? '',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.end),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            margin: EdgeInsets.all(12),
                            child: Text(news.content ?? '',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w300)),
                          ),
                          Container(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    _launchUrl(Uri.parse(news.url??''));
                                  },
                                  child: Text(
                                    'View Full Article',
                                    style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Icon(Icons.arrow_right),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
