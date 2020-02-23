import 'package:flutter/material.dart';
import 'package:flutter_websit/model/product.dart';
import 'package:flutter_websit/pages/product_detail_page.dart';
import 'package:flutter_websit/utils/utils.dart';

class HomeProductPage extends StatelessWidget {
  final ProductListModel list;

  HomeProductPage(this.list);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery
        .of(context)
        .size
        .width;

    //背景容器
    return Container(
      width: deviceWidth,
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 7.5),
      child: _build(context, deviceWidth),
    );
  }

  //返回标题及产品列表
  Widget _build(BuildContext context, double deviceWidth) {
    double itemWidth = deviceWidth * 168.5 / 360;
    double imageWidth = deviceWidth * 110.0 / 360;

    //返回产品列表
    List<Widget> listWidgets = list.data.map((i) {
      var bgColor = string2Color('#f8f8f8');
      Color titleColor = string2Color('#db5d41');
      Color subtitleColor = string2Color('#999999');


      return GestureDetector(
        onTap: () {
          //动态路由,是可以传参的
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(item: i)));
        },
        child: Container(
            width: itemWidth,
            margin: EdgeInsets.only(bottom: 5, left: 2),
            padding: EdgeInsets.only(top: 10, left: 13, bottom: 7),
            color: bgColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  i.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, color: titleColor),
                ),
                Text(
                  i.desc,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, color: subtitleColor),
                ),
                Container(
                  alignment: Alignment(0, 0),
                  margin: EdgeInsets.only(top: 5),
                  child: Image.asset(
                    i.imageUrl,
                    width: imageWidth,
                    height: imageWidth,
                  ),
                )
              ],
            )),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 5, bottom: 10),
          child: Text(
            '最新成品',
            style: TextStyle(
              fontSize: 16.0,
              color: Color.fromRGBO(51, 51, 51, 1),
            ),
          ),
        ),
        //流式布局列表
        Wrap(
          spacing: 2,
          children: listWidgets,
        )
      ],
    );
  }
}
