import 'package:qrching/data/api/model/api_client.dart';
import 'package:qrching/data/api/model/api_draw.dart';
import 'package:qrching/data/api/model/api_payments.dart';
import 'package:qrching/domain/model/client.dart';
import 'package:qrching/domain/model/draws.dart';
import 'package:qrching/domain/model/payments.dart';

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

  static Draws fromApiDraws(ApiDraws apiDraws) {
    return Draws(
        winner: apiDraws.winner,
        winnerId: apiDraws.winnerId,
        winning: apiDraws.winning,
        position: apiDraws.position,
        eventId: apiDraws.position,
        currencyId: apiDraws.position,
        currencyCode: apiDraws.currencyCode,
        payments: fromApiPayments(apiDraws.payments),
        errorMessage: apiDraws.error);
  }

  static Payments fromApiPayments(ApiPayments apiPayments) {
    return Payments(id: apiPayments.id, name: apiPayments.name);
  }
}
