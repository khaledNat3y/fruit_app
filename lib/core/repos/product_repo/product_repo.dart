import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/entities/product_entity.dart';

import '../../errors/failure.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProduct();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProduct();
}