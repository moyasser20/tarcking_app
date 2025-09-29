import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tarcking_app/features/homescreen/data/models/orders_list_response.dart';
import '../../../../core/api/client/api_client.dart';
import '../../../../core/errors/failure.dart';
import '../../data/data_sources/home_remote_datasource.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient apiClient;

  HomeRemoteDataSourceImpl(this.apiClient);

  String _extractApiMessage(DioException e) {
    final data = e.response?.data;
    if (data is Map) {
      return data['error'] ??
          data['message'] ??
          ServerFailure.fromDio(e).errorMessage;
    }
    if (data is String) {
      try {
        final decoded = json.decode(data);
        if (decoded is Map) {
          return decoded['error'] ??
              decoded['message'] ??
              ServerFailure.fromDio(e).errorMessage;
        }
      } catch (_) {}
    }
    return ServerFailure.fromDio(e).errorMessage;
  }

  @override
  Future<OrdersListResponse> getOrders() async {
    try {
      return await apiClient.getOrders();
    } on DioException catch (e) {
      throw ServerFailure(errorMessage: _extractApiMessage(e));
    } catch (e) {
      throw ServerFailure(errorMessage: e.toString());
    }
  }

}
