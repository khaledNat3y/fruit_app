import 'package:bloc/bloc.dart';
import 'package:fruits_app/core/repos/product_repo/product_repo.dart';
import 'package:meta/meta.dart';

import '../../entities/product_entity.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo productRepo;
  ProductCubit(this.productRepo) : super(ProductInitial());

  Future<void> getProducts() async {
    emit(ProductLoading());
    var result = await productRepo.getProduct();
    result.fold((failure){
      emit(ProductError(errMessage: failure.message));
    } , (products){
      emit(ProductSuccess(products: products));
    });
  }
  Future<void> getBestSellingProducts() async {
    emit(ProductLoading());
    var result = await productRepo.getBestSellingProduct();
    result.fold((failure){
      emit(ProductError(errMessage: failure.message));
    } , (products){
      emit(ProductSuccess(products: products));
    });
  }
}
