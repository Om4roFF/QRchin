import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:qrching/data/api/model/api_client.dart';
import 'package:qrching/data/api/request/get_client_body.dart';

class ClientService {
  static const _BASE_URL = 'https://qrching.com/api';

  final Dio _dio = Dio(BaseOptions(baseUrl: _BASE_URL));

  Future<ApiClient> createClient(GetClientBody getClientBody) async {
    final response = await _dio.post(
      '/create_member',
      queryParameters: getClientBody.toApi(),
      options: Options(headers: getClientBody.toApiHeader()),
    );
    log('RESPONSE STATUS CODE: ${response.statusCode}');
    log('RESPONSE BODY: ${response.data}');
    if (response.statusCode == 201 || response.statusCode == 422) {
      return ApiClient.fromJson(response.data);
    } else {
      return ApiClient.fromJson(response.data);
    }
  }
}
