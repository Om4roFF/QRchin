import 'package:qrching/data/api/model/api_client.dart';
import 'package:qrching/domain/model/client.dart';

class Mapper {
  static Client fromApiClient(ApiClient apiClient) {
    return Client(
        id: apiClient.id,
        hash: apiClient.hash,
        language: apiClient.language,
        country: apiClient.country,
        notes: apiClient.notes,
        statusId: apiClient.statusId,
        createdAt: apiClient.createdAt,
        updatedAt: apiClient.updatedAt,
        errorMessage: apiClient.errorMessage);
  }
}
