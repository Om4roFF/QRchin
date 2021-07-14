class GetClientBody {
  final String hash;
  final String language;
  final String country;

  GetClientBody(
      {required this.hash, required this.language, required this.country});

  Map<String, dynamic> toApi() {
    return {'country': country, 'language': language};
  }

  Map<String, String> toApiHeader() {
    return {'hash': hash};
  }
}
