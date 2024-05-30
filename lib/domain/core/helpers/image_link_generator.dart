
 import 'package:social_buzz/domain/core/constants/appwrite_constants.dart';

class UrlConverter {
  static String convertStringToUrl(String imgLinkId) {
    return 'https://cloud.appwrite.io/v1/storage/buckets/${AppWriteConstants.imagesBucketId}/files/${imgLinkId}/view?project=${AppWriteConstants.projectId}&mode=admin';
  }
}
