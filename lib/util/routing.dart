import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view/address.dart';
import '../view/info.dart';
import '../view/profile.dart';
import '../view/register_view.dart';

class Routing {
  static const String register = '/';
  static const String info = '/info';
  static const String address = '/address';
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var valuePassed;
    if (settings.arguments != null) {
      valuePassed = settings.arguments as Map<String, dynamic>;
    }

    switch (settings.name) {
      case info:
        return MaterialPageRoute(
          builder: (context) {
            return Info();
          },
        );
      case profile:
        return MaterialPageRoute(
          builder: (context) {
            return Profile();
          },
        );


      case register:
        return MaterialPageRoute(
          builder: (context) {
            return const UserRegister();
          },
        );
      case address:
        return MaterialPageRoute(
          builder: (context) {
            return const Address();
          },
        );

      default:
        throw 'no screen';
    }
  }
}
