import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:qrching/data/api/model/api_client.dart';
import 'package:qrching/data/api/model/api_draw.dart';
import 'package:qrching/data/api/request/get_client_body.dart';
import 'package:qrching/data/api/request/get_draws_body.dart';

class ClientService {
  static const _BASE_URL = 'https://qrching.com/api';

  final Dio _dio = Dio(BaseOptions(baseUrl: _BASE_URL));

  Future<ApiClient> createClient(GetClientBody getClientBody) async {
    print(getClientBody.toString());
    print(getClientBody.toApiHeader());
    print(getClientBody.toApi());
    final response = await _dio.post(
      '/create_member',
      queryParameters: getClientBody.toApi(),
      options: Options(headers: getClientBody.toApiHeader()),
    );
    log('RESPONSE STATUS CODE: ${response.statusCode}');
    log('RESPONSE BODY: ${response.data}');
    if (response.statusCode == 201 || response.statusCode == 200) {
      return ApiClient.fromJson(response.data);
    } else if (response.statusCode == 422) {
      return ApiClient.fromJson(response.data);
    } else {
      throw Exception(
          'Create client: code = ${response.statusCode}, body = ${response.data}');
    }
  }

  Future<ApiDraws> scanQR(GetDrawsBody getDrawsBody) async {
    print(getDrawsBody.toApiHeader());
    final response = await _dio.post(
      '/draws/${getDrawsBody.qrCode}',
      options: Options(
        headers: getDrawsBody.toApiHeader(),
      ),
    );
    log('RESPONSE STATUS CODE: ${response.statusCode}');
    log('RESPONSE BODY: ${response.data}');
    if (response.statusCode == 201 || response.statusCode == 200) {
      return ApiDraws.fromJson(response.data);
    } else if (response.statusCode == 403) {
      return ApiDraws.fromJson(response.data);
    } else {
      throw Exception(
          'Scan QR Exception: code = ${response.statusCode}, body = ${response.data}');
    }
  }
}
