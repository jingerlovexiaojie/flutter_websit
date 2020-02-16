import 'package:flutter/material.dart';
import 'package:flutter_websit/loading.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'app.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter企业站实战',
      //自定义主题
      theme: mDefaultTheme,
      //添加路由
      routes: <String, WidgetBuilder>{
        "app": (BuildContext context) => App(),
        "company_info": (BuildContext context) => WebviewScaffold(
              url: 'https://www.baidu.com',
              appBar: AppBar(
                title: Text('公司介绍'),
                leading: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    //路由到主界面
                    Navigator.of(context).pushReplacementNamed('app');
                  },
                ),
              ),
            )
      },
      //指定加载页面
      home: LoadingPage(),
    ));

final ThemeData mDefaultTheme = ThemeData(primaryColor: Colors.redAccent);
