import 'package:hive/hive.dart';
part 'pokenote.g.dart';

@HiveType(typeId: 0)
class PokeNote {
  @HiveField(0)
  String note;

  PokeNote({required this.note});
}