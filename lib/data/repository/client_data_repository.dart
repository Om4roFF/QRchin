import 'package:qrching/data/api/api_util.dart';
import 'package:qrching/domain/model/client.dart';
import 'package:qrching/domain/repository/client_repository.dart';

class ClientDataRepository extends ClientRepository {
  final ApiUtil _apiUtil;

  ClientDataRepository(this._apiUtil);

  @override
  Future<Client> createClient({hash, language, country}) {
    return _apiUtil.createClient(
        hash: hash, language: language, country: country);
  }
}
