import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../entities/product_entity.dart';
import '../../repos/product_repo/product_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;
  int productsLength = 0;
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getProducts();
    result.fold(
          (failure) => emit(ProductsError(errMessage: failure.message,)),
          (products) {
            productsLength = products.length;
            emit(ProductsSuccess(products: products));
          }
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getBestSellingProducts();
    result.fold(
          (failure) => emit(ProductsError(errMessage: failure.message,)),
          (products) {
        productsLength = products.length;
        emit(ProductsSuccess(products: products));
      },
    );
  }
}