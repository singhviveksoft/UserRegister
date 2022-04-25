import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_register/widgets/sizebox/between_editbox_widget.dart';

import '../provider/info_provider.dart';
import '../util/email_validated.dart';
import '../util/fieldtype.dart';
import '../util/routing.dart';
import '../widgets/button/elevated_btn/elevated_btn_submit.dart';
import '../widgets/button/outline_btn/back_press_outlinen_btn.dart';
import '../widgets/dropdown/form_dropdown.dart';
import '../widgets/image/back_icon.dart';
import '../widgets/text/TitleTextWidget.dart';
import '../widgets/text/header_title.dart';
import '../widgets/textformfill/textformfillwidget.dart';


class Info extends StatefulWidget {
  final String img;
  final String fName;
  final String lName;
  final String phoneNumber;
  final String email;
  final String gender;
  final String pwd;

  const Info({
    Key? key,
    required this.img,
    required this.fName,
    required this.lName,
    required this.phoneNumber,
    required this.email,
    required this.gender,
    required this.pwd,
  }) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> with InputValidationMixin {
  final _formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(widget.fName.toString());
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child:
              Consumer<InfoProvider>(builder: (context, infoProvider, child) {
            return Form(
              key: _formGlobalKey,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const BackIcon()
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      HeaderTitleText(
                        title: 'Your Info',
                      )
                    ],
                  ),
                  const TitleText(title: 'Educational Info'),
                  const TitleText(
                    title: 'Education*',
                  ),
                  DropDownForm(
                    value: infoProvider.eduDropdown,
                    dropDownList: const ['Post Graduate',
                      'Graduate',
                      'HSC/Diploma',
                      'SSC'],
                    onItemChange: (newValue){
                      infoProvider.getEducation(newValue);
                    },
                  ),


                  const TitleText(
                    title: 'Year of Passing *',
                  ),

                  DropDownForm(
                    value: infoProvider.yopDropdown,
                    dropDownList: const ['2015', '2016', '2017', '2018'],
                    onItemChange: (newValue){
                      infoProvider.getYOP(newValue);
                    },
                  ),


                  const TitleText(
                    title: 'Grade *',
                  ),
                  TextFormFillWidget(
                    iconData: Icons.person,
                    errorMsg: " Grade Can't be empty ",
                    hintMsg: 'Enter your grade',
                    editingController: infoProvider.gradeController,
                    textLength: null,
                    fieldType: FieldType.GRADE,
                  ),
                  const SizeBetweenEditBox(
                    height: 20.0,
                  ),
                  const Divider(
                    thickness: 1,
                    height: 10,
                    color: Colors.grey,
                  ),
                  const TitleText(
                    title: 'Professional Info',
                  ),
                  const TitleText(
                    title: 'Experience*',
                  ),
                  TextFormFillWidget(
                    errorMsg: "Experience Can't be empty",
                    hintMsg: 'Enter your Experience',
                    editingController: infoProvider.experienceController,
                    textLength: 2,
                    inputType: TextInputType.number,
                    fieldType: FieldType.EXP,
                    iconData: Icons.person,
                  ),
                  const TitleText(
                    title: 'Designation*',
                  ),

                  DropDownForm(
                    value: infoProvider.designationDropdown,
                    dropDownList: const ['Trainer', 'Jr', 'Sr', 'Manager'],
                    onItemChange: (newValue){
                      infoProvider.getDesignation(newValue);
                    },
                  ),


                  const TitleText(
                    title: 'Domain*',
                  ),

                  DropDownForm(
                    value: infoProvider.domainDropdown,
                    dropDownList: const ['Testing', 'Mobile', 'Web', 'Desktop'],
                    onItemChange: (newValue){
                      infoProvider.getDomain(newValue);
                    },
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PreviousOutlinedBtn(
                        width: 100,
                        height: null,
                        onClick: () {
                          Navigator.pop(context);
                        },
                        btnText: 'Previous',
                      ),
                      ElevatedBtnSubmit(
                        width: 100,
                        height: null,
                        onClick: () {
                          if (_formGlobalKey.currentState!.validate()) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            openAddressScreen(infoProvider);
                          }
                        },
                        btnText: "Next",
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
        ),
      ),
    ));
  }



  openAddressScreen(InfoProvider infoProvider) {
    Navigator.pushNamed(context, Routing.address, arguments: {
      'img': widget.img,
      'fName': widget.fName,
      'lName': widget.lName,
      'phoneNumber': widget.phoneNumber,
      'email': widget.email,
      'gender': widget.gender,
      'pwd': widget.pwd,
      'edu': infoProvider.eduDropdown,
      'yop': infoProvider.yopDropdown,
      'grade': infoProvider.gradeController.text,
      'exp': infoProvider.experienceController.text,
      'designation': infoProvider.designationDropdown,
      'domain': infoProvider.domainDropdown,
    });
  }
}
