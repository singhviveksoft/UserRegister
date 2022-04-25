

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';
import 'package:user_register/util/fieldtype.dart';
import 'package:user_register/util/routing.dart';

import '../provider/user_register_provider.dart';
import '../util/email_validated.dart';
import '../widgets/bottom_sheet/camera_permissio_bottom_sheet.dart';
import '../widgets/button/elevated_btn/elevated_btn_submit.dart';
import '../widgets/radiobox/gender_radio.dart';
import '../widgets/text/TitleTextWidget.dart';
import '../widgets/text/header_title.dart';
import '../widgets/textformfill/pwdtextformfillwidget.dart';
import '../widgets/textformfill/textformfillwidget.dart';


class UserRegister extends StatefulWidget {
  const UserRegister({Key? key}) : super(key: key);

  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> with InputValidationMixin {
  var choosenImage;
  final _formGlobalKey = GlobalKey<FormState>();


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

                    const HeaderTitleText(
                      title: 'Register',
                    ),
                    InkWell(
                      onTap: () async{
                        choosenImage=  await  ImagePickerBottomSheet.bottomSheet(context);
                      },
                      child: userRegisterProvider.image == null
                          ? SizedBox(
                              width: 100,
                              height: 100,
                              child: Stack(
                                children: [
                                  Image.asset(
                                    'images/user.png',
                                    fit: BoxFit.cover,
                                  ),
                                  const Positioned(
                                     top: 20,
                                      left: 75,
                                      child: Icon(Icons.edit_outlined,size:30.0,)),


                                ],

                              ))
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.file(
                                userRegisterProvider.image!,
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              ),
                            ),
                    ),
                    const TitleText(
                      title: 'First Name *',
                    ),
                    TextFormFillWidget(
                      iconData:  Icons.person,
                      errorMsg: 'Not less than 3 character',
                      hintMsg: 'Enter your first name here',
                      editingController: userRegisterProvider.fName,
                      textLength: null,
                      fieldType: FieldType.FNAME,
                    ),
                    const TitleText(title: 'Last Name *'),
                    TextFormFillWidget(
                      iconData:  Icons.person,
                      errorMsg: 'Not less than 3 character',
                      hintMsg: 'Last Name',
                      editingController: userRegisterProvider.lName,
                      textLength: null,
                      fieldType: FieldType.LNAME,
                    ),
                    const TitleText(title: 'Phone Number *'),
                    TextFormFillWidget(
                      iconData: Icons.phone,
                      errorMsg: 'Plz enter 10 digit nos',
                      hintMsg: 'Phone Number',
                      editingController: userRegisterProvider.mobNos,
                      textLength: 10,
                      inputType: TextInputType.phone,
                      fieldType: FieldType.MOB,
                    ),
                    const TitleText(title: 'Email *'),
                    TextFormFillWidget(
                      iconData: Icons.email,
                      errorMsg: 'Plz enter proper email',
                      hintMsg: 'Email',
                      editingController: userRegisterProvider.email,
                      textLength: null,
                      fieldType: FieldType.EMAIL,
                    ),
                    const TitleText(title: 'Gender *'),
                    Row(
                      verticalDirection: VerticalDirection.up,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        GenderRadioBox(radioValue: 1, onClick: (value){
                          userRegisterProvider.getGender(value as int);
                        },
                          groupValue:  userRegisterProvider.genderType,),


                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Men',),
                        ),
                        GenderRadioBox(radioValue: 2, onClick: (value){
                          userRegisterProvider.getGender(value as int);
                        },
                          groupValue:  userRegisterProvider.genderType,),

                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Female'),
                        ),
                      ],
                    ),
                    const TitleText(title: 'Password *'),
                    PwdTextFormFill(
                      hintMsg: 'Password',
                      visible: userRegisterProvider.passwordVisible,
                      onClick: () {
                        userRegisterProvider.getPwdVisibility(
                            !userRegisterProvider.passwordVisible);
                      },
                      errorMsg: 'Plz enter proper pwd',
                      editingController: userRegisterProvider.passwd,
                      fieldType: FieldType.PWD,
                      validatePwd: null,
                    ),
                    const TitleText(title: 'Confirm Password *'),
                    PwdTextFormFill(
                      hintMsg: 'Confirm Password',
                      visible: userRegisterProvider.confirmPasswordVisible,
                      onClick: () {
                        userRegisterProvider.getConfirmPwdVisibility(
                            !userRegisterProvider.confirmPasswordVisible);
                      },
                      errorMsg: null,
                      editingController: userRegisterProvider.confirmPass,
                      fieldType: FieldType.COINFPWD,
                      validatePwd: () {
                        return userRegisterProvider.passwd.text;
                      },
                    ),
                    ElevatedBtnSubmit(
                      width: double.infinity,

                      onClick: () {
                        if (_formGlobalKey.currentState!.validate()) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          moveToInfoScreen(userRegisterProvider);
                        }
                      },
                      btnText: "NEXT",
                    ),


                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }


  moveToInfoScreen(UserRegisterProvider userRegisterProvider){
    if (choosenImage == null) {
      Navigator.pushNamed(context, Routing.info,
          arguments: {
            'img': '',
            'fName': userRegisterProvider.fName.text,
            'lName': userRegisterProvider.lName.text,
            'phoneNumber':
            userRegisterProvider.mobNos.text,
            'email': userRegisterProvider.email.text,
            'gender': userRegisterProvider.genderType
                .toString(),
            'pwd': userRegisterProvider.passwd.text,
          });
    }else{
      Navigator.pushNamed(context, Routing.info,
          arguments: {
            'img': choosenImage.path,
            'fName': userRegisterProvider.fName.text,
            'lName': userRegisterProvider.lName.text,
            'phoneNumber':
            userRegisterProvider.mobNos.text,
            'email': userRegisterProvider.email.text,
            'gender': userRegisterProvider.genderType
                .toString(),
            'pwd': userRegisterProvider.passwd.text,
          });
    }
  }


}
