import 'package:meta/meta.dart';
import 'package:qrching/domain/model/client.dart';

abstract class ClientRepository {
  Future<Client> createClient(
      {@required hash, @required language, @required country});
}
