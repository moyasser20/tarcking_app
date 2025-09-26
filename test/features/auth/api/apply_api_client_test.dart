import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarcking_app/core/api/api_constants/api_end_points.dart';
import 'package:tarcking_app/features/auth/api/api_client/apply_api_client.dart';

void main() {
  group('ApplyApiClient', () {
    late Dio dio;
    late ApplyApiClient client;

    setUp(() {
      dio = Dio(BaseOptions());
      client = ApplyApiClient(dio);
    });

    test('applyDriver posts to correct endpoint with FormData', () async {
      final requests = <RequestOptions>[];
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            requests.add(options);
            handler.resolve(
              Response(
                requestOptions: options,
                statusCode: 200,
                data: {
                  'message': 'ok',
                  'driver': {
                    'country': 'Egypt',
                    'firstName': 'A',
                    'lastName': 'B',
                    'vehicleType': 'Car',
                    'vehicleNumber': '123',
                    'vehicleLicense': 'lic.png',
                    'NID': '123',
                    'NIDImg': 'id.png',
                    'email': 'a@b.com',
                    'gender': 'Male',
                    'phone': '01000000000',
                    'photo': '',
                    'role': 'driver',
                    '_id': '1',
                    'createdAt': 'now',
                  },
                  'token': 't',
                },
              ),
            );
          },
        ),
      );

      await client.applyDriver(
        country: 'Egypt',
        firstName: 'A',
        lastName: 'B',
        vehicleType: 'Car',
        vehicleNumber: '123',
        vehicleLicense: MultipartFile.fromString('file'),
        nid: '123',
        nidImg: MultipartFile.fromString('file'),
        email: 'a@b.com',
        password: 'password!1',
        rePassword: 'password!1',
        gender: 'Male',
        phone: '01000000000',
      );

      expect(requests, isNotEmpty);
      final req = requests.first;
      expect(req.method, 'POST');
      expect(req.path, ApiEndPoints.apply);
      expect(req.data, isA<FormData>());
    });
  });
}
