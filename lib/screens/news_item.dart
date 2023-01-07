import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_c7_fri/models/NewsResponse.dart';
import 'package:news_c7_fri/screens/news_details.dart';

class NewsItem extends StatelessWidget {

  Articles News;
  NewsItem(this.News);
static bool select=false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetails.routeName,arguments:News );
        select=true;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: News.urlToImage??"",
            width: double.infinity,
            height: 180,
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),

          Text(News.author??"",style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade400
          ),),
          Text(News.title??"",style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black
      ),),
          Text(News.publishedAt?.substring(0,10)??"",textAlign: TextAlign.right,)
        ],
      ),
    );
  }
}
