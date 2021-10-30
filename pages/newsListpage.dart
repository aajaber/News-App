import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/newsArticleListViewModel.dart';
import 'package:news_app/viewmodels/newsArticleViewModel.dart';
import 'package:news_app/widgets/news_list.dart';
import 'package:provider/provider.dart';

import 'newsArticleDetailsPage.dart';

class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final _searchController = TextEditingController();

  // this initState method will fetch data as soon as the page/ screen is loaded.
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticalListViewModel>(context, listen: false)
        .populateTopHeadLines();
  }

  void _showNewsArticleDetails(
      BuildContext context, NewsArticleViewModel article) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewsArticleDetails(article: article)));
  }

  Widget _buildList(BuildContext context, NewsArticalListViewModel viewModel) {
    switch (viewModel.searchingStatus) {
      case SearchStatus.searching:
        return Align(child: CircularProgressIndicator());

      case SearchStatus.empty:
        return Align(child: Text("No Data Found!"));

      case SearchStatus.completed:
        return Expanded(
            child: NewsList(
          articles: viewModel.articles,
          onSelected: (article) {
            _showNewsArticleDetails(context, article);
          },
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsArticalListViewModel>(context);
    return Scaffold(
        appBar: AppBar(title: Text('Top News'), centerTitle: true),
        body: Column(
          children: [
            TextField(
              onSubmitted: (value) {
                // fetch all the news related to the entred keyword.
                if (value.isNotEmpty) {
                  viewModel.search(value);
                }
              },
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Search:",
                icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search)),
                suffix: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                    }),
              ),
            ),
            _buildList(context, viewModel),
          ],
        ));
  }
}
