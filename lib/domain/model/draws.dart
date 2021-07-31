import 'package:qrching/domain/model/payments.dart';

class Draws {
  final bool winner;
  final int winnerId;
  final int winning;
  final int position;
  final int eventId;
  final int currencyId;
  final String currencyCode;
  final Payments payments;
  final String? errorMessage;

  const Draws(
      {required this.winner,
      required this.winnerId,
      required this.winning,
      required this.position,
      required this.eventId,
      required this.currencyId,
      required this.currencyCode,
      required this.payments,
      required this.errorMessage});

  bool isError() {
    if (this.errorMessage != '') return true;
    return false;
  }
}
