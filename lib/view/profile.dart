

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:user_register/data/user_registeration_model.dart';

import '../data/boxe.dart';

class Profile extends StatefulWidget {

  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:SafeArea(child:
    ValueListenableBuilder<Box<User>>(
      valueListenable: Boxes.getUser().listenable(),
      builder: (context, box, _) {
        final user = box.values.toList().cast<User>();

        return  ListView.builder(
          itemCount: user.length,
          itemBuilder: (context, index) {
            return user.length>0?
               Card(

                child:user[index].img!.isNotEmpty? Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.file(File(user[index].img.toString()),fit: BoxFit.cover,
                          width: 100,
                          height: 100,)),
                    Text(user[index].fName.toString()),
                    Text(user[index].lName.toString()),
                    Text(user[index].phoneNumber.toString()),
                    Text(user[index].email.toString()),
                  ],
                ):Column(
                  children: [
                    SizedBox(

                        width: 100,
                        height: 100,
                        child: Image.asset('images/user.png',fit: BoxFit.cover,)),
                    Text(user[index].fName.toString()),
                    Text(user[index].lName.toString()),
                    Text(user[index].phoneNumber.toString()),
                    Text(user[index].email.toString()),
                  ],
                ),
              ):Center(child: CircularProgressIndicator(),);

          },
        );
      },
    ),
   ));
  }
  @override
  void dispose() {

    super.dispose();
  }
}
