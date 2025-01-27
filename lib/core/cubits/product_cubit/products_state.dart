part of 'products_cubit.dart';


@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}


final class ProductsError extends ProductsState {
  final String errMessage;
  ProductsError({required this.errMessage});
}
final class ProductsSuccess extends ProductsState {
  final List<ProductEntity> products;
  ProductsSuccess({required this.products});
}
