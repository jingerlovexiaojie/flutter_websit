import 'package:flutter/material.dart';
import 'package:flutter_websit/model/news.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsItemModel item;

//  ProductDetail(this.item);

  NewsDetailPage({Key key,@required this.item}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(item.content),
      )
    );
  }
}
