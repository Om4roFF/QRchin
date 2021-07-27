class ApiPayments {
  final int id;
  final String name;

  const ApiPayments({required this.id, required this.name});

  factory ApiPayments.fromJson(Map<String, dynamic> json) {
    return ApiPayments(id: json['id'], name: json['name']);
  }
}
