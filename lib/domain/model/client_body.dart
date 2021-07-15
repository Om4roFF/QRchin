class ClientBody {
  final String hash;
  final String language;
  final String country;

  ClientBody(
      {required this.hash, required this.language, required this.country});

  factory ClientBody.empty() {
    return ClientBody(hash: '', language: '', country: '');
  }

  Map<String, dynamic> toApi() {
    return {'country': country, 'language': language};
  }

  Map<String, String> toApiHeader() {
    return {'hash': hash};
  }
}
