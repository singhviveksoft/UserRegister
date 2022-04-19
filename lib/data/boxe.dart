import 'package:hive/hive.dart';

import 'package:user_register/data/user_registeration_model.dart';

class Boxes {
  static Box<User> getUser() =>
      Hive.box<User>('user');
}