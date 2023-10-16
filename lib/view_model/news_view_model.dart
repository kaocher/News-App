import 'package:news_app/model/news_categories_model.dart';
import 'package:news_app/model/news_headline_model.dart';
import 'package:news_app/repository/news_repository.dart';

class NewsViewModel {
  final _repo = NewsRepository();
//------------------Fetch Headlines----------------
  Future<NewsHeadlineModel> fetchNewsHeadline(String channelName) async {
    final response = await _repo.fetchNewsHeadline(channelName);
    return response;
  }

  //----------------Fetch Categories-------------

  Future<NewsCategoriesModel> fetchNewsCategories(String categoriesName) async {
    final response = await _repo.fetchNewsCategories(categoriesName);
    return response;
  }
}
