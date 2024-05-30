import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_buzz/domain/core/constants/appwrite_constants.dart';
import 'package:social_buzz/infrastructure/repo/auth/auth_service.dart';
import 'package:social_buzz/infrastructure/third_party_service/appwrite_services.dart';

final clientProvider = Provider((ref) {
  Client client = Client();
  return client
      .setEndpoint(AppWriteConstants.appWriteEndpoint)
      .setProject(AppWriteConstants.projectId)
      .setSelfSigned(status: true);
});

final appWriteService = Provider((ref) {
  final client = ref.watch(clientProvider);
  return AppWriteServices(account: Account(client));
});

final authRepositoryImplProvider = Provider((ref) {
  final appWriteServices = ref.watch(appWriteService);
  return AuthRepositoryImpl(appWriteServices: appWriteServices);
});

final databaseProvider = Provider((ref) {
  final client = ref.watch(clientProvider);
  return Databases(client);
});

final storageProvider = Provider((ref) {
  final client = ref.watch(clientProvider);
  return Storage(client);
});


final realTimeProvider = Provider((ref){
   final client = ref.watch(clientProvider);
   return Realtime(client);
});