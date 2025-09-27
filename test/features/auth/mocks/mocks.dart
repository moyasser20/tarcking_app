import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:tarcking_app/features/auth/api/api_client/apply_api_client.dart';
import 'package:tarcking_app/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:tarcking_app/features/auth/domain/repositories/auth_repo.dart';

class MockDio extends Mock implements Dio {}

class MockApplyApiClient extends Mock implements ApplyApiClient {}

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDatasource {}

class MockAuthRepo extends Mock implements AuthRepo {}
