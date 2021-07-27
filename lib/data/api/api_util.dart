import 'package:qrching/data/api/request/get_client_body.dart';
import 'package:qrching/data/api/request/get_draws_body.dart';
import 'package:qrching/data/api/service/client_service.dart';
import 'package:qrching/data/mapper.dart';
import 'package:qrching/domain/model/client.dart';
import 'package:qrching/domain/model/draws.dart';

class ApiUtil {
  final ClientService _clientService;

  ApiUtil(this._clientService);

  Future<Client> createClient(
      {required String hash,
      required String language,
      required String country}) async {
    final body =
        GetClientBody(hash: hash, language: language, country: country);
    final result = await _clientService.createClient(body);
    return Mapper.fromApiClient(result);
  }

  Future<Draws> scanQR({required String hash, required String qrCode}) async {
    final body = GetDrawsBody(hash: hash, qrCode: qrCode);
    final result = await _clientService.scanQR(body);
    return Mapper.fromApiDraws(result);
  }
}
