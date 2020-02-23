import 'package:flutter/material.dart';
import 'package:flutter_websit/model/news.dart';
import 'package:flutter_websit/pages/news_detail_page.dart';
import 'package:flutter_websit/pages/product_list_page.dart';
import 'package:flutter_websit/services/product.dart';

class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsPageState();
  }
}

class NewsPageState extends State<NewsPage> {
  NewsListModel listData = NewsListModel([]);

  void getNewstList() async {
    var data = await getProductResult();
    NewsListModel list = NewsListModel.fromJson(data);
    setState(() {
      listData.data.addAll(list.data);
    });
  }

  @override
  void initState() {
    getNewstList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        separatorBuilder: (BuildContext contect, int index) => Divider(
          height: 1.0,
          color: Colors.grey,
        ),
        itemCount: listData.data.length,
        itemBuilder: (BuildContext contect, int index) {
          NewsItemModel item = listData.data[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.content),
            leading: Icon(Icons.fiber_new),
            trailing: Icon(Icons.arrow_forward),
            contentPadding: EdgeInsets.all(10.0),
            enabled: true,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailPage(item: item)));
            },
          );
        },
      ),
    );
  }
}
