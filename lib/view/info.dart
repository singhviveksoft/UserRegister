import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/info_provider.dart';
import '../util/email_validated.dart';
import '../util/routing.dart';

class Info extends StatefulWidget {
 final String img;
 final String fName;
 final String lName;
 final String phoneNumber;
 final String email;
 final String gender;
 final String pwd;
  const Info({Key? key,required this.img,required this.fName,required this.lName,required this.phoneNumber,required this.email,required this.gender,required this.pwd,}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> with InputValidationMixin{
  final _formGlobalKey = GlobalKey<FormState>();
  final TextEditingController _gradeController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.fName.toString());
    return Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child:
              Consumer<InfoProvider>(
                  builder: (context, infoProvider, child) {
                    return  Form(
                      key: _formGlobalKey,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Your Info',
                                style: TextStyle(
                                    fontSize: 30.0, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 0.0, top: 8.0, right: 0.0, bottom: 8.0),
                                child: Text(
                                  'Educational Info',
                                  style: TextStyle(
                                      fontSize: 18.0, fontWeight: FontWeight.bold),
                                ),
                              )),
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Education*',
                                style: TextStyle(
                                    fontSize: 15.0, fontWeight: FontWeight.bold),
                              )),




                          Container(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 0.0, right: 0.0, bottom: 0.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 1.0)),
                            child: DropdownButton<String>(
                              value: infoProvider.eduDropdown,
                              hint: Text('Select'),
                              //  ask for position
                              items: <String>['Post Graduate', 'Graduate', 'HSC/Diploma', 'SSC'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newvalue) {
                               infoProvider.getEducation(newvalue!);
                              },

                              isExpanded: true,
                              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 0.0, top: 8.0, right: 0.0, bottom: 0.0),
                                child: Text(
                                  'Year of Passing *',
                                  style: TextStyle(
                                      fontSize: 15.0, fontWeight: FontWeight.bold),
                                ),
                              )),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 0.0, right: 0.0, bottom: 0.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 1.0)),
                            child: DropdownButton<String>(
                              value: infoProvider.yopDropdown,
                              hint: const Text('Select'),
                              //  ask for position
                              items: <String>['2015', '2016', '2017', '2018'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newvalue) {
                               infoProvider.getYOP(newvalue!);
                              },

                              isExpanded: true,
                              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 0.0, top: 8.0, right: 0.0, bottom: 0.0),
                              child: Text(
                                'Grade *',
                                style: TextStyle(
                                    fontSize: 15.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          TextFormField(

                            controller: _gradeController,
                            validator: (String? value) {
                              if (isEmptyValid(value!)) {
                                return " Grade Can't be empty ";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                errorBorder: const OutlineInputBorder(

                                    borderSide: BorderSide(color: Colors.red, width:1)) ,
                                hintText: 'Enter your grade',
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5.0))),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Divider(
                            thickness: 1,
                            height: 10,
                            color: Colors.grey,
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 0.0, top: 8.0, right: 0.0, bottom: 0.0),
                              child: Text(
                                'Professional Info',
                                style: TextStyle(
                                    fontSize: 18.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 0.0, top: 8.0, right: 0.0, bottom: 0.0),
                              child: Text(
                                'Experience*',
                                style: TextStyle(
                                    fontSize: 15.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          TextFormField(

                            keyboardType: TextInputType.number,
                            controller: _experienceController,
                            validator: (String? value) {
                              if (isEmptyValid(value!)) {
                                return " Experience Can't be empty ";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                errorBorder: const OutlineInputBorder(

                                    borderSide: BorderSide(color: Colors.red, width:1)) ,
                                hintText: 'Enter your Experience',
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
                                  'Designation*',
                                  style: TextStyle(
                                      fontSize: 15.0, fontWeight: FontWeight.bold),
                                ),
                              )),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 0.0, right: 0.0, bottom: 0.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 1.0)),
                            child: DropdownButton<String>(
                              value: infoProvider.designationDropdown,
                              hint: const Text('Select'),
                              //  ask for position
                              items: <String>['Trainer', 'Jr', 'Sr', 'Manager'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newvalue) {
                                infoProvider.getDesignation(newvalue!);
                              },

                              isExpanded: true,
                              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 0.0, top: 8.0, right: 0.0, bottom: 0.0),
                                child: Text(
                                  'Domain*',
                                  style: TextStyle(
                                      fontSize: 15.0, fontWeight: FontWeight.bold),
                                ),
                              )),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 0.0, right: 0.0, bottom: 0.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 1.0)),
                            child: DropdownButton<String>(
                              value: infoProvider.domainDropdown,
                              hint: const Text('Select'),
                              //  ask for position
                              items: <String>['Testing', 'Mobile', 'Web', 'Desktop'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newvalue) {
                               infoProvider.getDomain(newvalue!);
                              },

                              isExpanded: true,
                              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(onPressed: () {}, child: Text('Previous')),
                              ElevatedButton(
                                onPressed: () {
       if (_formGlobalKey.currentState!.validate()) {
         FocusManager.instance.primaryFocus?.unfocus();
      Navigator.pushNamed(context, Routing.address,arguments: {
        'img':widget.img,
        'fName':widget.fName,
        'lName':widget.lName,
        'phoneNumber':widget.phoneNumber,
        'email':widget.email,
        'gender':widget.gender,
        'pwd':widget.pwd,

        'edu':infoProvider.eduDropdown,
        'yop':infoProvider.yopDropdown,
        'grade':_gradeController.text,
        'exp':_experienceController.text,
        'designation':infoProvider.designationDropdown,
        'domain':infoProvider.domainDropdown,
      });
    }

                                },
                                child: const Text('Next'),
                              )
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
}
