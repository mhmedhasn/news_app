import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_c7_fri/models/NewsResponse.dart';
import 'package:news_c7_fri/models/SourcesResponse.dart';
import 'package:news_c7_fri/shared/components/constants.dart';

class ApiManager {
  static Future<SourcesResponse> getSources(String categoryId) async {
    Uri URL = Uri.https(BASE, '/v2/top-headlines/sources',
        {"apiKey": APIKEY, "category": categoryId});
    Response sources = await http.get(URL);
    try {
      var json = jsonDecode(sources.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      print("Error Here $e");
      throw e;
    }
  }

  static Future<NewsResponse> getNews({String? sourceId, String? query}) async {

    Uri URL = Uri.https(BASE, '/v2/everything',
        {"apiKey": APIKEY, "sources": sourceId, "q": query});
    Response newsData = await http.get(URL);

    var json = jsonDecode(newsData.body);

    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}
