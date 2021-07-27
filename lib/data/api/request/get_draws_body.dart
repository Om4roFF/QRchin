class GetDrawsBody {
  final String hash;
  final String qrCode;

  const GetDrawsBody({required this.hash, required this.qrCode});

  Map<String, String> toApiHeader() {
    return {'hash': hash};
  }
}
