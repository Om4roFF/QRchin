import 'package:qrching/data/repository/client_data_repository.dart';
import 'package:qrching/domain/repository/client_repository.dart';
import 'package:qrching/internal/dependencies/api_module.dart';

class RepositoryModule {
  static ClientRepository? _clientRepository;

  static ClientRepository clientRepository() {
    if (_clientRepository == null) {
      _clientRepository = ClientDataRepository(ApiModule.apiUtil());
    }
    return _clientRepository!;
  }
}
