import 'package:qrching/data/api/model/api_payments.dart';

class ApiDraws {
  final bool winner;
  final int winnerId;
  final int winning;
  final int position;
  final int eventId;
  final int currencyId;
  final String currencyCode;
  final ApiPayments payments;
  final String error;

  const ApiDraws(
      {required this.winner,
      required this.winnerId,
      required this.winning,
      required this.position,
      required this.eventId,
      required this.currencyId,
      required this.currencyCode,
      required this.payments,
      required this.error});

  factory ApiDraws.fromJson(Map<String, dynamic> json) {
    return ApiDraws(
      winner: json['winner'],
      winnerId: json['winner_id'],
      winning: json['winning'],
      position: json['position'],
      eventId: json['event_id'],
      currencyId: json['currency_id'],
      currencyCode: json['currency_code'],
      payments: ApiPayments.fromJson(json['payments']),
      error: json['data']['error'],
    );
  }
}
