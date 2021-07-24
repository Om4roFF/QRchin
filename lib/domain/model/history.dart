import 'package:hive/hive.dart';

part 'history.g.dart';

@HiveType(typeId: 0)
class History {
  @HiveField(0)
  final String url;

  @HiveField(1)
  final String date;

  @HiveField(2)
  final String? iconUrl;

  const History({required this.url, required this.date, this.iconUrl});
}
