import 'package:hive/hive.dart';
import 'model/user.dart';

class Boxes {
  static Box<UserTest> getNewUser() => Hive.box<UserTest>('user');
}
