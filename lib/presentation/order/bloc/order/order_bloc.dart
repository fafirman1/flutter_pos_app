import 'package:bloc/bloc.dart';
import 'package:flutter_pos_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_pos_app/data/datasources/product_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../home/models/order_item.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final productRemoteDatasource = ProductRemoteDatasource();
  OrderBloc() : super(const _Success([],0,0,'',0,0,'')) {
    on<_AddPaymentMethod>((event, emit) async {
      final userData = await AuthLocalDatasource().getAuthData();
      emit(const _loading());
      emit(_Success(
        event.orders, 
        event.orders.fold(
          0, (previousValue, element) => previousValue + element.quantity), 
        event.orders.fold(
          0, (previousValue, element) => previousValue + ( element.quantity * element.product.price)), 
        event.paymentMethod, 
        0,
        userData.user.id,
        userData.user.name
      ));
    });

    on<_AddNominalBayar>((event, emit) async {
      var currentStates = state as _Success;
      emit(const _loading());
       for (var i = 0; i < currentStates.products.length; i++) {
        final productId = currentStates.products[i].product.productId;
        final qty = currentStates.products[i].quantity;
        await productRemoteDatasource.updateStock(productId!, qty);
      }
      emit(_Success(
        currentStates.products, 
        currentStates.totalQuantity, 
        event.nominal, 
        currentStates.paymentMethod, 
        event.nominal,
        currentStates.idKasir,
        currentStates.namaKasir
        ));
    },);

    on<_Started>((event, emit) {
      emit(const _loading());
      emit(const _Success([], 0, 0, '', 0, 0, ''));
    },);
  }
}
