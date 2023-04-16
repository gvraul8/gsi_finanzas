import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article_model.dart';

class ApiService{
  final endPointUrl = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=8a45baa4e8c74af89e43f7e438a797f7";

  Future<List<Article>> getArticles() async {
    final response = await http.get(Uri.parse(endPointUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw Exception('Failed to load news');
    }
  }
}