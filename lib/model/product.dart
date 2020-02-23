class ProductItemModel{
  String desc;
  String type ;
  String name;
  String imageUrl;
  String point;

  ProductItemModel({
    this.desc,
    this.type,
    this.name,
    this.imageUrl,
    this.point,
});

  factory ProductItemModel.fromJson(dynamic json){
    return ProductItemModel(
      desc: json['desc'],
      type: json['type'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      point: json['point'],
    );
  }
}

class ProductListModel {
  List<ProductItemModel> data;
  ProductListModel(this.data);

  factory ProductListModel.fromJson(List json){
    return ProductListModel(
      json.map((i)=>ProductItemModel.fromJson((i))).toList()
    );
  }

}