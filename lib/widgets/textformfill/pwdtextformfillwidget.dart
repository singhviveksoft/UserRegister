import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/user_register_provider.dart';
import '../../util/email_validated.dart';
import '../../util/fieldtype.dart';

class PwdTextFormFill extends StatefulWidget {
  final String? errorMsg;
  final String? hintMsg;
  final TextEditingController? editingController;

  final bool visible;
  final Function onClick;
  final Function? validatePwd;
  final FieldType? fieldType;

  const PwdTextFormFill(
      {Key? key,
      required this.errorMsg,
      required this.hintMsg,
      required this.visible,
      required this.onClick,
      required this.fieldType,
      required this.editingController,
      required this.validatePwd})
      : super(key: key);

  @override
  _PwdTextFormFillState createState() => _PwdTextFormFillState();
}

class _PwdTextFormFillState extends State<PwdTextFormFill>
    with InputValidationMixin {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.visible,
      controller: widget.editingController,
      validator: (String? pwd) {
        var checkValue = widget.validatePwd?.call();

        switch (widget.fieldType) {
          case FieldType.PWD:
            {
              if (validatePassword(pwd!)) {
                return widget.errorMsg;
              }
            }
            break;

          case FieldType.COINFPWD:
            {
              if (checkValue != widget.editingController!.text) {
                return "Pwd doesn't match";
                break;
              } else if (widget.editingController!.text.isEmpty) {
                return 'Confirm Pwd is empty';
              }
            }
        }
        return null;
      },
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1)),
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              widget.visible ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              widget.onClick.call();
            },
          ),
          prefixIcon: const Icon(
            Icons.lock,
            color: Colors.black,
          ),
          hintText: widget.hintMsg,
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0))),
    );
  }
}
