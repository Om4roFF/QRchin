import 'package:qrching/data/api/api_util.dart';
import 'package:qrching/data/api/service/client_service.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(ClientService());
    }
    return _apiUtil!;
  }
}
