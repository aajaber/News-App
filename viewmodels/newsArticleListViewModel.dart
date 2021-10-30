import 'package:flutter/cupertino.dart';
import 'package:news_app/models/newsArticle.dart';
import 'package:news_app/services/webService.dart';
import 'package:news_app/viewmodels/newsArticleViewModel.dart';

enum SearchStatus {
  completed,
  searching,
  empty,
}

class NewsArticalListViewModel extends ChangeNotifier {
  var searchingStatus = SearchStatus.completed;

  // ignore: deprecated_member_use
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  Future<void> search(String keyword) async {
    this.searchingStatus = SearchStatus.searching;
    notifyListeners();
    List<NewsArticle> newsArticles =
        await Webservice().fetchHeadlinesByKeyword(keyword);
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    this.searchingStatus =
        this.articles.isEmpty ? SearchStatus.empty : SearchStatus.completed;
    notifyListeners();
  }

  Future<void> populateTopHeadLines() async {
    // this.searchingStatus = SearchStatus.searching;
    // notifyListeners();
    List<NewsArticle> newsArticles = await Webservice().fetchTopHeadLines();
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    // this.searchingStatus =
    //     this.articles.isEmpty ? SearchStatus.empty : SearchStatus.completed;
    notifyListeners();
  }
}
