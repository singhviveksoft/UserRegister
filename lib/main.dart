import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:user_register/provider/address_provider.dart';
import 'package:user_register/provider/user_register_provider.dart';
import 'package:user_register/provider/info_provider.dart';
import 'package:user_register/util/routing.dart';
import 'package:user_register/view/register_view.dart';

import 'data/user_registeration_model.dart';

void main()async  {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('user');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(providers: [
        ChangeNotifierProvider<UserRegisterProvider>(
          create: (context) {
            return UserRegisterProvider();
          },
        ),
        ChangeNotifierProvider<InfoProvider>(
          create: (context) {
            return InfoProvider();
          },
        ),

        ChangeNotifierProvider<AddressProvider>(
          create: (context) {
            return AddressProvider();
          },
        ),
      ],
        child:   MaterialApp(
          title: 'User Register',

          onGenerateRoute: Routing.generateRoute,
          initialRoute: Routing.register,
          theme: ThemeData(

            primarySwatch: Colors.blue,
          ),
          home: const UserRegister(),
        )

      );




  }
}


