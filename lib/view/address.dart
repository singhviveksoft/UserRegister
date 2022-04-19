import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_register/data/user_registeration_model.dart';
import 'package:user_register/util/routing.dart';

import '../data/boxe.dart';
import '../provider/address_provider.dart';
import '../util/email_validated.dart';

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
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.phoneNumber.toString());
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
                  child: const Align(
                      alignment: Alignment.topLeft,
                      child: Icon(Icons.arrow_back)),
                ),
                const Text(
                  'Your Address',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: _addressController,
                  validator: (String? value) {
                    if (!isNameValid(value!)) {
                      return 'Not less than 3 character';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1)),
                      prefixIcon: const Icon(
                        Icons.place,
                        color: Colors.black,
                      ),
                      hintText: 'Address',
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0))),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: _landmarkController,
                  validator: (String? value) {
                    if (!isNameValid(value!)) {
                      return 'Not less than 3 character';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1)),
                      prefixIcon: const Icon(
                        Icons.place,
                        color: Colors.black,
                      ),
                      hintText: 'Landmark',
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0))),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _cityController,
                  validator: (String? value) {
                    if (!isNameValid(value!)) {
                      return 'Not less than 3 character';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1)),
                      prefixIcon: const Icon(
                        Icons.place,
                        color: Colors.black,
                      ),
                      hintText: 'City',
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0))),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 8.0, top: 0.0, right: 0.0, bottom: 0.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.0)),
                  child: DropdownButton<String>(
                    value: addressProvider.stateDropdown,
                    hint: const Text('Select'),
                    //  ask for position
                    items: <String>[
                      'Maharashtra',
                      'Gujarat',
                      'Karnataka',
                      'Madhya Pradesh',
                      'Delhi'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newvalue) {
                      addressProvider.getState(newvalue!);
                    },

                    isExpanded: true,
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _pinCodeController,
                  validator: (String? value) {
                    if (!isPinCodeValid(value!)) {
                      return 'Enter PinCode of 6 digits';
                    }
                    return null;
                  },
                  maxLength: 6,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1)),
                      prefixIcon: const Icon(
                        Icons.place,
                        color: Colors.black,
                      ),
                      hintText: 'PinCode',
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),

                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0))),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formGlobalKey.currentState!.validate()) {
                        FocusManager.instance.primaryFocus?.unfocus();
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
                            address: _addressController.text,
                            landmark: _landmarkController.text,
                            city: _cityController.text,
                            state: addressProvider.stateDropdown,
                            pinCode: _pinCodeController.text);
                        final box = Boxes.getUser();
                        box.add(user);
                        Navigator.pushNamed(context, Routing.profile);
                      }

                      /*if (_formGlobalKey.currentState!.validate()) {
                          Navigator.pushNamed(context, Routing.info);
                        }*/
                    },
                    child: const Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    })));
  }
}
