// this file will be responsible of creating the network request.

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/newsArticle.dart';
import 'package:news_app/utils/constants.dart';

class Webservice {
  // ==============this connection will get all the filtered data based on a keyword.
  Future<List<NewsArticle>> fetchHeadlinesByKeyword(String keyword) async {
    final response = await http.get(Uri.parse(Constants.headlinesFor(keyword)));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((json) => NewsArticle.fromJSON(json)).toList();
    } else {
      throw Exception("Failed to get news");
    }
  }

  // ==========================================this connection will  get all the data .
  Future<List<NewsArticle>> fetchTopHeadLines() async {
    final response = await http.get(Uri.parse(Constants.TOP_HEADLINES_URL));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception("Failed to get top news");
    }
  }
}
