import 'package:flutter/material.dart';
import 'package:news_app/pages/newsArticleDetailsPage.dart';
import 'package:news_app/viewmodels/newsArticleViewModel.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  final Function(NewsArticleViewModel article) onSelected;

  NewsList({this.articles, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final article = articles[index];

        return ListTile(
          onTap: () {
            this.onSelected(article);
          },
          leading: Container(
            width: 100,
            height: 100,
            child: article.imageURL == null
                ? Image.asset("images/place_holder.png") // placeholder image.
                : Image.network(article.imageURL),
          ),
          title: Text(articles[index].title),
        );
      },
      itemCount: articles.length,
    );
  }
}
