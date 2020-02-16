import 'package:flutter/material.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoadingState();
  }
}

class _LoadingState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();

    //在加载页面停顿3秒
    Future.delayed(Duration(seconds: 3), () {
      print('Fluter企业站启动...');
      Navigator.of(context).pushReplacementNamed("app");
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Center(
          child: Stack(
            children: <Widget>[
              Image.asset('assets/images/loading.jpeg'),
              Center(
                child: Text(
                  'Flutter企业站',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36.0,
                      decoration: TextDecoration.none),
                ),
              )
            ],
          ),
        ));
  }
}
