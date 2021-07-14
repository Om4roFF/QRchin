class ApiClient {
  final int id;
  final String hash;
  final String language;
  final String country;
  final String? notes;
  final int? statusId;
  final String? createdAt;
  final String? updatedAt;
  final String? errorMessage;

  ApiClient(
      {required this.id,
      required this.hash,
      required this.language,
      required this.country,
      this.notes,
      this.statusId,
      this.createdAt,
      this.updatedAt,
      this.errorMessage});

  factory ApiClient.fromJson(Map<String, dynamic> map) {
    return ApiClient(
      id: map['data']['id'],
      hash: map['data']['hash'],
      language: map['data']['language'],
      country: map['data']['country'],
      notes: map['data']['notes'],
      statusId: map['data']['status_id'],
      createdAt: map['data']['created_at'],
      updatedAt: map['data']['updated_at'],
      errorMessage: map['data']['error'],
    );
  }
}
