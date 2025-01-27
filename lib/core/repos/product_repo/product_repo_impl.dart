import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/repos/product_repo/product_repo.dart';
import 'package:fruits_app/core/utils/backend_endpoints.dart';

import '../../entities/product_entity.dart';
import '../../errors/failure.dart';
import '../../models/product_model.dart';
import '../../services/data_base_service.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoints.getProducts,
          query: {
            'limit': 10,
            'orderBy': 'sellingCount',
            'descending': true
          }) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
      data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure(message: "error from get best selling products method, error: ${e.toString()}",));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoints.getProducts) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
      data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure(message: "error from get products method, error: ${e.toString()}"));
    }
  }
}