import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tarcking_app/features/homescreen/api/data_sources_impl/home_remote_datasource_impl.dart';
import 'package:tarcking_app/features/homescreen/data/models/orders_list_response.dart';
import 'package:tarcking_app/core/errors/failure.dart';
import 'package:tarcking_app/core/api/client/api_client.dart';

import 'home_remote_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient mockApiClient;
  late HomeRemoteDataSourceImpl dataSource;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = HomeRemoteDataSourceImpl(mockApiClient);
  });

  group('getOrders', () {
    const token = "Bearer fake_token";

    test('should return OrdersListResponse when API call succeeds', () async {
      // arrange
      final ordersListResponse = OrdersListResponse(
        message: "Success",
        orders: [],
        metadata: {},
      );

      when(
        mockApiClient.getOrders(any),
      ).thenAnswer((_) async => ordersListResponse);

      // act
      final result = await dataSource.getOrders();

      // assert
      expect(result, isA<OrdersListResponse>());
      expect(result.message, "Success");
      verify(mockApiClient.getOrders(any)).called(1);
    });

    test('should throw ServerFailure when DioException occurs', () async {
      // arrange
      when(mockApiClient.getOrders(any)).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: "/orders"),
          response: Response(
            requestOptions: RequestOptions(path: "/orders"),
            statusCode: 400,
            data: {"message": "Bad Request"},
          ),
        ),
      );

      // act
      final call = dataSource.getOrders;

      // assert
      expect(() => call(), throwsA(isA<ServerFailure>()));
    });

    test(' should throw ServerFailure when unknown Exception occurs', () async {
      // arrange
      when(mockApiClient.getOrders(any)).thenThrow(Exception("Unexpected"));

      // act
      final call = dataSource.getOrders;

      // assert
      expect(() => call(), throwsA(isA<ServerFailure>()));
    });
  });
}
