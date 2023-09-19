import 'package:hive/hive.dart';
part 'sys_user.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  late String username;
  @HiveField(1)
  late int id;
  @HiveField(2)
  late String password;
  @HiveField(3)
  late String nickname;
  @HiveField(4)
  late String email;
  @HiveField(5)
  late String phone;
  @HiveField(6)
  late String address;
  @HiveField(7)
  late DateTime create_time;
  @HiveField(8)
  late String avatar_url;
  @HiveField(9)
  late String role;
}
