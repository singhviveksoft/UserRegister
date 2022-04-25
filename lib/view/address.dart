import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_register/data/user_registeration_model.dart';
import 'package:user_register/util/routing.dart';

import '../data/boxe.dart';
import '../provider/address_provider.dart';
import '../util/email_validated.dart';
import '../util/fieldtype.dart';
import '../widgets/button/elevated_btn/elevated_btn_submit.dart';
import '../widgets/dropdown/form_dropdown.dart';
import '../widgets/image/back_icon.dart';
import '../widgets/sizebox/between_editbox_widget.dart';
import '../widgets/text/header_title.dart';
import '../widgets/textformfill/textformfillwidget.dart';

class Address extends StatefulWidget {
  final String edu;
  final String yop;
  final String grade;
  final String exp;
  final String designation;
  final String domain;
  final String img;
  final String fName;
  final String lName;
  final String phoneNumber;
  final String email;
  final String gender;
  final String pwd;

  const Address(
      {Key? key,
      required this.edu,
      required this.yop,
      required this.grade,
      required this.exp,
      required this.designation,
      required this.domain,
      required this.img,
      required this.fName,
      required this.lName,
      required this.phoneNumber,
      required this.email,
      required this.gender,
      required this.pwd})
      : super(key: key);

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> with InputValidationMixin {
  final _formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(widget.exp.toString());
    return Scaffold(body: SafeArea(child:
        Consumer<AddressProvider>(builder: (context, addressProvider, child) {
      return SingleChildScrollView(
        child: Form(
          key: _formGlobalKey,
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const BackIcon()
                ),

                const HeaderTitleText(
                  title: 'Your Address',
                ),

                const SizeBetweenEditBox(
                  height: 20.0,
                ),
                TextFormFillWidget(
                  iconData: Icons.location_city,
                  errorMsg: 'Not less than 3 character',
                  hintMsg: 'Address',
                  editingController: addressProvider.addressController,
                  textLength: null,
                  fieldType: FieldType.ADDRESS,
                ),
                const SizeBetweenEditBox(
                  height: 20.0,
                ),
                TextFormFillWidget(
                  iconData: Icons.location_city,
                  errorMsg: 'Not less than 3 character',
                  hintMsg: 'Landmark',
                  editingController: addressProvider.landmarkController,
                  textLength: null,
                  fieldType: FieldType.LANDMARK,
                ),
                const SizeBetweenEditBox(
                  height: 20.0,
                ),
                TextFormFillWidget(
                  inputType: TextInputType.text,
                  iconData: Icons.location_city,
                  errorMsg: 'Not less than 3 character',
                  hintMsg: 'City',
                  editingController: addressProvider.cityController,
                  textLength: null,
                  fieldType: FieldType.CITY,
                ),
                const SizeBetweenEditBox(
                  height: 20.0,
                ),

                  DropDownForm(
                    value:  addressProvider.stateDropdown,
                    dropDownList: const ['Maharashtra',
                      'Gujarat',
                      'Karnataka',
                      'Madhya Pradesh',
                      'Delhi'],
                    onItemChange: (newValue){
                      addressProvider.getState(newValue);
                    },
                  ),




                const SizeBetweenEditBox(
                  height: 20.0,
                ),
                TextFormFillWidget(
                  inputType: TextInputType.number,
                  iconData: Icons.location_city,
                  errorMsg: 'Enter PinCode of 6 digits',
                  hintMsg: 'PinCode',
                  editingController: addressProvider.pinCodeController,
                  textLength: 6,
                  fieldType: FieldType.PINCODE,
                ),
                const SizeBetweenEditBox(
                  height: 20.0,
                ),
                ElevatedBtnSubmit(
                  width: double.infinity,
                  height: 50,
                  onClick: () {
                    if (_formGlobalKey.currentState!.validate()) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      addItemToDB(addressProvider);
                    }
                  },
                  btnText: "Submit",
                ),
              ],
            ),
          ),
        ),
      );
    })));
  }

  addItemToDB(AddressProvider addressProvider) {
    var user = User(
        img: widget.img,
        fName: widget.fName,
        lName: widget.lName,
        phoneNumber: widget.phoneNumber,
        email: widget.email,
        gender: widget.gender,
        pwd: widget.pwd,
        edu: widget.edu,
        yop: widget.yop,
        grade: widget.grade,
        exp: widget.exp,
        designation: widget.designation,
        domain: widget.domain,
        address: addressProvider.addressController.text,
        landmark: addressProvider.landmarkController.text,
        city: addressProvider.cityController.text,
        state: addressProvider.stateDropdown,
        pinCode: addressProvider.pinCodeController.text);
    final box = Boxes.getUser();
    box.add(user);
    Navigator.pushNamed(context, Routing.profile);
  }
}
