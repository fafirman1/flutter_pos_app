import 'package:dartz/dartz.dart';
import 'package:flutter_pos_app/core/constants/variables.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pos_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_pos_app/data/models/response/product_response_model.dart';


class ProductRemoteDatasource {
  Future<Either<String, ProductResponseModel>> getProducts() async{
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/products'),
      headers: {
        'Authorization': 'Bearer ${authData.token}',
      }
    );

    if (response.statusCode == 200){
      return right(ProductResponseModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }

  //update stock
  Future<Either<String, String>> updateStock(
      int productId, int qty) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final Map<String, String> headers = {
      'Authorization': 'Bearer ${authData.token}',
    };
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/products/update-stock'),
      headers: headers,
      body: {
        'product_id': productId.toString(),
        'stock': qty.toString(),
      },
    );

    if (response.statusCode == 200) {
      return right('Success');
    } else {
      return left(response.body);
    }
  }

  
} 