import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductRequestModel {
  final String name;
  final int price;
  final int stock;
  final String category;
  ProductRequestModel({
    required this.name,
    required this.price,
    required this.stock,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'stock': stock,
      'category': category,
    };
  }

  // factory ProductRequestModel.fromMap(Map<String, dynamic> map) {
  //   return ProductRequestModel(
  //     name: map['name'] ??'',
  //     price: map['price'] ?.toInt()??0,
  //     stock: map['stock'] ?.toInt()??0,
  //     category: map['category'] ??'',
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory ProductRequestModel.fromJson(String source) => ProductRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
