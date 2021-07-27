import 'package:qrching/data/api/api_util.dart';
import 'package:qrching/domain/model/client.dart';
import 'package:qrching/domain/model/draws.dart';
import 'package:qrching/domain/repository/client_repository.dart';

class ClientDataRepository extends ClientRepository {
  final ApiUtil _apiUtil;

  ClientDataRepository(this._apiUtil);

  @override
  Future<Client> createClient(
      {required String hash,
      required String language,
      required String country}) {
    return _apiUtil.createClient(
        hash: hash, language: language, country: country);
  }

  @override
  Future<Draws> scanQR({required String hash, required String qrCode}) {
    return _apiUtil.scanQR(hash: hash, qrCode: qrCode);
  }
}
