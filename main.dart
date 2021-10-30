import 'package:flutter/material.dart';
import 'package:news_app/pages/newsListpage.dart';
import 'package:news_app/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Daily News",
      home: ChangeNotifierProvider(
        create: (context) => NewsArticalListViewModel(),
        child: NewsListPage(),
      ),
    );
  }
}
