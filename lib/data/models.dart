import 'package:hive/hive.dart';

part 'models.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {

  @HiveField(1)
  String title;

  @HiveField(2)
  String body;

  Note({
    required this.title,
    required this.body,
  });
}
