import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/NewsDataModel.dart';

class NewsCard extends StatelessWidget {
  Articles articles;

  NewsCard(this.articles);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: articles.urlToImage ?? "",
            height: 180,
            fit: BoxFit.fill,
            placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            )),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text(articles.title ?? "",
              style: TextStyle(color: Colors.grey.shade500, fontSize: 13)),
          Text(articles.description ?? "",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Text(articles.publishedAt?.substring(0, 10) ?? "",
              textAlign: TextAlign.right),
        ],
      ),
    );
  }
}
