import 'package:qrching/domain/model/client.dart';
import 'package:qrching/domain/model/draws.dart';

abstract class ClientRepository {
  Future<Client> createClient(
      {required String hash,
      required String language,
      required String country});

  Future<Draws> scanQR({required String hash, required String qrCode});
}
