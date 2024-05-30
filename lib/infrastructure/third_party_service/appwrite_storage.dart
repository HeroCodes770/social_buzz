import 'dart:developer';
import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_buzz/domain/core/constants/appwrite_constants.dart';
import 'package:social_buzz/domain/core/dependency_injection.dart';
import 'package:social_buzz/domain/core/helpers/image_link_generator.dart';

final storageApiProvider = Provider((ref) {
  final storageApi = ref.watch(storageProvider);
  return StorageApi(storageApi: storageApi);
});

class StorageApi {
  final Storage _storage;

  StorageApi({required Storage storageApi}) : _storage = storageApi;

  Future<List<String>> uploadImage(List<File> files) async {
    try {
      List<String> imgLinks = [];
      for (final file in files) {
        final uploadImage = await _storage.createFile(
          bucketId: AppWriteConstants.imagesBucketId,
          fileId: ID.unique(),
          file: InputFile.fromPath(path: file.path),
        );
        imgLinks.add(UrlConverter.convertStringToUrl(uploadImage.$id));

        log('This is the image list from the storage api $imgLinks');
        return imgLinks;
      }
    } on AppwriteException catch (e) {
      log(e.message!);
      rethrow;
    } catch (e) {
      log('Throwing the error from the catch block');
      rethrow;
    }
    return [];
  }
}
