import 'dart:typed_data';

import 'package:baby_info/db_baby/baby_entity.dart';
import 'package:baby_info/main.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class NameSexLogic extends GetxController {

  bool isEdit = Get.arguments ?? false;

  Uint8List? photo;
  String name = '';
  DateTime? birthday;
  String birthdayStr = '';
  int sex = -1;
  String sexStr = '';

  void imageSelected() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(imageQuality: 90,maxWidth: 1024,source: ImageSource.gallery);
      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        photo = imageBytes;
        update();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Please check album permissions or select a new image');
      return;
    }
  }

  void birthdaySelected() async {
    final pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: birthday ?? DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      birthday = pickedDate;
      birthdayStr = DateFormat('MM/dd/yyyy').format(birthday!);
      update();
    }
  }

  void sexSelected() {
    BottomPicker(pickerTitle:const Text(''), items: sexList.map((e) => Text(e)).toList(),onSubmit: (index) {
      sex = index;
      sexStr = sexList[index];
      update();
    },).show(Get.context!);

  }

  void save() {
    if (photo == null) {
      Fluttertoast.showToast(msg: 'Please select a photo');
      return;
    }
    if (name.isEmpty || birthday == null || sex == -1) {
      Fluttertoast.showToast(msg: 'Please fill in all fields');
      return;
    }
    Get.toNamed(
      '/heightWeight',
      arguments: BabyEntity(
          id: 0,
          createdTime: DateTime.now(),
          photo: photo!,
          name: name,
          birthday: birthday!,
          sex: sex,
          height: '',
          weight: '',
          head: ''),
      parameters: {'isEdit': isEdit ? '1' : '0'},
    );
  }
}
