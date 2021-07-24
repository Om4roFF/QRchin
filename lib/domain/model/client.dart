class Client {
  final int id;
  final String hash;
  final String language;
  final String country;
  final String? notes;
  final int? statusId;
  final String? createdAt;
  final String? updatedAt;
  final String? errorMessage;

  const Client(
      {required this.id,
      required this.hash,
      required this.language,
      required this.country,
      this.notes,
      this.statusId,
      this.createdAt,
      this.updatedAt,
      this.errorMessage});

  @override
  String toString() {
    return 'HASH: $hash\t ERROR: $errorMessage';
  }
}
