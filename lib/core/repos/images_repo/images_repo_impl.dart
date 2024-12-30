import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../errors/failure.dart';
import '../../services/storage_service.dart';
import '../../utils/backend_endpoints.dart';
import 'images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageService storageService;

  ImagesRepoImpl(this.storageService);


  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url =
      await storageService.upLoadFile(image, BackendEndpoints.images);
      return Right(url);
    } catch (e) {
      return Left(
        ServerFailure(message: 'Failed to upload image'),
      );
    }
  }
}