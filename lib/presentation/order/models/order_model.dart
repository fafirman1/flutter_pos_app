// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:convert';

import 'package:flutter_pos_app/presentation/home/models/order_item.dart';

class OrderModel {
  final String paymentMethod;
  final int nominalBayar;
  final List<OrderItem> orders;
  final int totalQuantity;
  final int totalPrice;
  final int idKasir;
  final String namaKasir; 
  final bool isSync;
  OrderModel({
    required this.paymentMethod,
    required this.nominalBayar,
    required this.orders,
    required this.totalQuantity,
    required this.totalPrice,
    required this.idKasir,
    required this.namaKasir,
    required this.isSync,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'paymentMethod': paymentMethod,
      'nominalBayar': nominalBayar,
      'orders': orders.map((x) => x.toMap()).toList(),
      'totalQuantity': totalQuantity,
      'totalPrice': totalPrice,
      'idKasir': idKasir,
      'namaKasir':namaKasir,
      'isSync': isSync,
    };
  }

  Map<String, dynamic> toMapForLocal() {
    return <String, dynamic>{
      'payment_method': paymentMethod,
      'total_item': totalQuantity,
      'nominal': totalPrice,
      'id_kasir': idKasir,
      'nama_kasir': namaKasir,
      'is_Sync': isSync ? 1:0,
    };
  }

  factory OrderModel.fromLocalMap(Map<String, dynamic> map) {
    return OrderModel(
      paymentMethod: map['payment_method'] ?? '',
      nominalBayar: map['nominal'] ?.toInt()??0,
      orders: [],
      totalQuantity: map['total_item'] ?.toInt()??0,
      totalPrice: map['nominal'] ?.toInt()??0,
      idKasir: map['id_kasir'] ?.toInt()??0,
      isSync: map['is_Sync'] == 1 ? true:false,
      namaKasir: map['nama_kasir']??''
    );
  }
  
  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      paymentMethod: map['paymentMethod'] ?? '',
      nominalBayar: map['nominalBayar'] ?.toInt()??0,
      orders: List<OrderItem>.from((map['orders'] as List<int>).map<OrderItem>((x) => OrderItem.fromMap(x as Map<String,dynamic>),),),
      totalQuantity: map['totalQuantity'] ?.toInt()??0,
      totalPrice: map['totalPrice'] ?.toInt()??0,
      idKasir: map['idKasir'] ?.toInt()??0,
      isSync: map['isSync'] ?? false,
      namaKasir: map['namaKasir']??''
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
