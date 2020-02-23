import 'package:flutter/material.dart';
import 'package:flutter_websit/model/product.dart';
import 'package:flutter_websit/pages/product_detail_page.dart';
import 'package:flutter_websit/style/color.dart';
import 'package:flutter_websit/style/font.dart';

class ProductResultListWidget extends StatelessWidget {
  final ProductListModel list;
  final VoidCallback getNextPage;

  ProductResultListWidget(this.list, {this.getNextPage});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return list.data.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            itemCount: list.data.length,
            itemBuilder: (BuildContext context, int i) {
              ProductItemModel item = list.data[i];
              //加载一页
              if ((i + 4) == list.data.length) {
                getNextPage();
              }
              return GestureDetector(
                onTap: () {
                  //动态路由,是可以传参的
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(item: item)));
                },
                child: Container(
                  color: ProductColors.bgColor,
                  padding: EdgeInsets.only(top: 5.0, right: 5.0),
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        item.imageUrl,
                        width: 120.0,
                        height: 120.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: ProductColors.dividerLineColor))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                item.desc,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    item.type,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: ProductColors.typeColor),
                                  ),
                                  item.point == null ? SizedBox() : Container(
                                    child: Text(
                                      item.point,
                                      style: TextStyle(
                                        color: ProductColors.pointColor,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 3),
                                    margin: EdgeInsets.only(left: 4),
                                    decoration: BoxDecoration(border: Border.all(width: 1,color: ProductColors.pointColor)),

                                  )
                                ],
                              ),
                              Text(
                                item.name,
                                style: ProductFonts.itemNameStype,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
  }
}
