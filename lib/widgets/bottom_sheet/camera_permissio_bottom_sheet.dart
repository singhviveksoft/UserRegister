import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../provider/user_register_provider.dart';

class ImagePickerBottomSheet{
 static dynamic bottomSheet(BuildContext context) async {
   dynamic isImageSelected;
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
                    isImageSelected=    await getImage(ImageSource.gallery,context);
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
                    isImageSelected=       await getImage(ImageSource.camera,context);
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
    return isImageSelected;
  }

 static dynamic getImage(ImageSource imageSource,BuildContext context) async {
 var  choosenImage = await ImagePicker()
       .pickImage(source: imageSource, maxWidth: 100, maxHeight: 100);
   if (choosenImage != null) {
     Provider.of<UserRegisterProvider>(context, listen: false)
         .getSelectedImg(File(choosenImage.path));
   }
return choosenImage;
 }
}