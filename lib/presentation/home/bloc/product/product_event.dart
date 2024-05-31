part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.started() = _Started;
  const factory ProductEvent.fetch() = _Fetch;
  const factory ProductEvent.fetchByCategory(String category) = _FetchByCategory;
  //fetch from local
  const factory ProductEvent.fetchLocal() = _FetchLocal;
  //Search Product
  const factory ProductEvent.searchProduct(String query) = _SearchProduct;
  //fetch all from state
  const factory ProductEvent.fetchAllFromState() = _FetchLocalFromState;
}