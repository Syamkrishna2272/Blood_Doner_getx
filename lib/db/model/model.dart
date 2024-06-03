import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class Personmodel {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String age;

  @HiveField(2)
  late String bloodgroup;

  @HiveField(3)
  late String place;

  @HiveField(4)
  late String mobile;

  Personmodel(this.name, this.age, this.bloodgroup, this.place, this.mobile);
}
