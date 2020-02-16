import 'package:flutter/material.dart';
import 'pages/about_us.dart';
import 'pages/home_page.dart';
import 'pages/news_page.dart';
import 'pages/product_page.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  //当前选择页面索引
  var _currentIndex = 0;

  HomePage homePage;

  ProductPage productPage;

  NewsPage newsPage;

  AboutUsPage aboutUsPage;

  //根据不同索引返回页面
  currentPage() {
    switch (_currentIndex) {
      case 0:
        if (homePage == null) {
          homePage = HomePage();
        }
        return homePage;
      case 1:
        if (productPage == null) {
          productPage = ProductPage();
        }
        return productPage;
      case 2:
        if (newsPage == null) {
          newsPage = NewsPage();
        }
        return newsPage;
      case 3:
        if (aboutUsPage == null) {
          aboutUsPage = AboutUsPage();
        }
        return aboutUsPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter企业站实战'),
        leading: Icon(Icons.home),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.search),
            ),
          )
        ],
      ),

      body: currentPage(),

      //底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: ((index) {
          setState(() {
            _currentIndex = index;
          });
        }),
        //底部导航栏
        items: [
          BottomNavigationBarItem(
              title: Text(
                '首页',
                style: TextStyle(
                    color: _currentIndex == 0
                        ? Colors.redAccent
                        : Color(0xff999999)),
              ),
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text(
                '产品',
                style: TextStyle(
                    color: _currentIndex == 1
                        ? Colors.redAccent
                        : Color(0xff999999)),
              ),
              icon: Icon(Icons.apps)),
          BottomNavigationBarItem(
              title: Text(
                '新闻',
                style: TextStyle(
                    color: _currentIndex == 2
                        ? Colors.redAccent
                        : Color(0xff999999)),
              ),
              icon: Icon(Icons.fiber_new)),
          BottomNavigationBarItem(
              title: Text(
                '关于我们',
                style: TextStyle(
                    color: _currentIndex == 3
                        ? Colors.redAccent
                        : Color(0xff999999)),
              ),
              icon: Icon(Icons.insert_comment)),
        ],
      ),
    );
  }
}
