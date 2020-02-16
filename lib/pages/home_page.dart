import 'package:flutter/material.dart';
import 'package:flutter_websit/model/product.dart';
import 'package:flutter_websit/pages/home_banner.dart';
import 'package:flutter_websit/pages/home_product_page.dart';
import 'package:flutter_websit/services/product.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  ProductListModel listData = ProductListModel([]);

  void getProductList() async{
    var data = await getProductResult();
    ProductListModel list = ProductListModel.fromJson(data);
    
    setState(() {
      listData.data.addAll(list.data);
    });
  }

  @override
  void initState() {
   getProductList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          BannerWidget(),
          HomeProductPage(listData)
        ],
      ),
    );
  }
}