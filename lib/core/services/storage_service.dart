import 'dart:io';

abstract class StorageService {
  Future<String> upLoadFile(File file, String path);
}