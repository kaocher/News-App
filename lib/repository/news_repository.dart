import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_categories_model.dart';
import 'package:news_app/model/news_headline_model.dart';

class NewsRepository {
  Future<NewsHeadlineModel> fetchNewsHeadline(String channelName) async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=$channelName&apiKey=74c4d4471744458fa6ac77fb8f98186f";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return NewsHeadlineModel.fromJson(body);
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      throw e.toString();
    }
  }

   Future<NewsCategoriesModel> fetchNewsCategories(String categoryName) async {
    String url =
        "https://newsapi.org/v2/everything?q=$categoryName&apiKey=74c4d4471744458fa6ac77fb8f98186f";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return NewsCategoriesModel.fromJson(body);
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
     throw e.toString();
    }
  }
}
