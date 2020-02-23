import 'package:flutter/material.dart';
import 'package:flutter_websit/model/product.dart';
import 'package:flutter_websit/pages/product_list_page.dart';
import 'package:flutter_websit/services/product.dart';

class ProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductPageState();
  }
}

class ProductPageState extends State<ProductPage> {

  ProductListModel listData = ProductListModel([]);

  int page = 0;

  void getProductList() async{
    var data = await getProductResult(page++);
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
    return ProductResultListWidget(listData,getNextPage:()=>getProductList(),);
  }
}