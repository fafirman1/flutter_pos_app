import 'package:flutter_pos_app/data/models/response/product_response_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class AddProductResponseModel {
    final bool success;
    final String message;
    final List<Product> data;

    AddProductResponseModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory AddProductResponseModel.fromJson(String str) {
        return AddProductResponseModel.fromMap(json.decode(str));
    }

    String toJson() => json.encode(toMap());

    factory AddProductResponseModel.fromMap(Map<String, dynamic> json) {
        return AddProductResponseModel(
            success: json["success"],
            message: json["message"],
            data: List<Product>.from(json["data"].map((x) => Product.fromMap(x))),
        );
    }

    Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}
