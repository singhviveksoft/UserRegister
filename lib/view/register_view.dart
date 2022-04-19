import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';
import 'package:user_register/util/routing.dart';

import '../provider/user_register_provider.dart';
import '../util/email_validated.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({Key? key}) : super(key: key);

  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> with InputValidationMixin {
  var choosenImage;
  final _formGlobalKey = GlobalKey<FormState>();
  final TextEditingController _fName = TextEditingController();
  final TextEditingController _lName = TextEditingController();
  final TextEditingController _mobNos = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _passwd = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formGlobalKey,
              child: Consumer<UserRegisterProvider>(
                  builder: (context, userRegisterProvider, child) {
                return Column(
                  children: [
                    const Text(
                      'Register',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        _bottomSheet(context);
                      },
                      child: userRegisterProvider.image == null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: SizedBox(

                                  width: 100,
                                  height: 100,
                                  child: Image.asset('images/user.png',fit: BoxFit.contain,)))
                          : Image.file(
                              userRegisterProvider.image!,
                              fit: BoxFit.cover,
                            ),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 0.0, top: 8.0, right: 0.0, bottom: 0.0),
                        child: Text(
                          'First Name *',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _fName,
                      validator: (String? Fvalue) {
                        if (!isNameValid(Fvalue!)) {
                          return 'Not less than 3 character';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          errorBorder: const OutlineInputBorder(

                              borderSide: BorderSide(color: Colors.red, width:1)) ,
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          hintText: 'Enter your first name here',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 0.0, top: 8.0, right: 0.0, bottom: 0.0),
                        child: Text(
                          'Last Name *',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _lName,
                      validator: (String? Lvalue) {
                        if (!isNameValid(Lvalue!)) {
                          return 'Not less than 3 character';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          errorBorder: const OutlineInputBorder(

                              borderSide: BorderSide(color: Colors.red, width:1)) ,
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          hintText: 'Last Name',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 0.0, top: 8.0, right: 0.0, bottom: 0.0),
                        child: Text(
                          'Phone Number *',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TextFormField(
                      maxLength: 10,
                      controller: _mobNos,
                      keyboardType: TextInputType.phone,
                      validator: (String? nos) {
                        if (!isMobileValid(nos!)) {
                          return 'Plz enter 10 digit nos';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                          hintText: 'Phone Number',
                          errorBorder: const OutlineInputBorder(

                    borderSide: BorderSide(color: Colors.red, width:1)) ,

                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 0.0, top: 8.0, right: 0.0, bottom: 0.0),
                        child: Text(
                          'Email *',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _email,
                      validator: (String? email) {
                        if (!isEmailValid(email!)) {
                          return 'Plz enter proper email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          errorBorder: const OutlineInputBorder(

                              borderSide: BorderSide(color: Colors.red, width:1)) ,
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          hintText: 'Email',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 0.0, top: 8.0, right: 0.0, bottom: 0.0),
                        child: Text(
                          'Gender *',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 1,
                            groupValue: userRegisterProvider.genderType,
                            onChanged: (value) {
                              userRegisterProvider.getGender(value as int);
                              print(value.toString());
                            }),
                        const Text('Men'),
                        Radio(
                            value: 2,
                            groupValue: userRegisterProvider.genderType,
                            onChanged: (value) {
                              userRegisterProvider.getGender(value as int);
                              print(value.toString());
                            }),
                        const Text('Female'),
                      ],
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 0.0, top: 8.0, right: 0.0, bottom: 0.0),
                        child: Text(
                          'Password *',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TextFormField(

                      obscureText: userRegisterProvider.passwordVisible,
                      controller: _passwd,
                      validator: (String? pwd) {
                        if (validatePassword(pwd!)) {
                          return 'Plz enter proper pwd';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          errorBorder: const OutlineInputBorder(

                              borderSide: BorderSide(color: Colors.red, width:1)) ,
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              userRegisterProvider.passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              userRegisterProvider.getPwdVisibility(
                                  !userRegisterProvider.passwordVisible);
                            },
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          hintText: 'Password',

                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 0.0, top: 8.0, right: 0.0, bottom: 0.0),
                        child: Text(
                          'Confirm Password *',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TextFormField(
                      obscureText: userRegisterProvider.confirmPasswordVisible,
                      controller: _confirmPass,
                      validator: (String? pwd) {
                        if (_confirmPass.text != _passwd.text) {
                          return 'Password not match';
                        }else if(isEmptyValid(pwd!)){
                          return 'Plz enter proper pwd';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          errorBorder: const OutlineInputBorder(

                              borderSide: BorderSide(color: Colors.red, width:1)) ,
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              userRegisterProvider.confirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              userRegisterProvider.getConfirmPwdVisibility(
                                  !userRegisterProvider.confirmPasswordVisible);
                            },
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          hintText: 'Confirm Password',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formGlobalKey.currentState!.validate()) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            Navigator.pushNamed(context, Routing.info,arguments: {
                              'img':choosenImage.path,
                              'fName':_fName.text,
                              'lName':_lName.text,
                              'phoneNumber':_mobNos.text,
                              'email':_email.text,
                              'gender':userRegisterProvider.genderType.toString(),
                              'pwd':_passwd.text,
                            });
                          }
                        },
                        child: const Text("NEXT"),
                      ),
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  _bottomSheet(BuildContext context) async {
    print('_bottomSheet');
    await showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await getImage(ImageSource.gallery);
                    Navigator.of(context).pop(true);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xff123456),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  child: const Text(
                    'Gallery',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await getImage(ImageSource.camera);
                    Navigator.of(context).pop(true);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff123456),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  child: const Text(
                    'Camera',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  getImage(ImageSource imageSource) async {
     choosenImage = await ImagePicker()
        .pickImage(source: imageSource, maxWidth: 70, maxHeight: 70);
    if (choosenImage != null) {
      Provider.of<UserRegisterProvider>(context, listen: false)
          .getSelectedImg(File(choosenImage.path));
    }
  }
}
