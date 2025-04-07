import 'package:baby_info/db_baby/db_baby.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';


class BabySecondLogic extends GetxController {

  DBBaby dbBaby = Get.find();

  cleanBabyData() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to clean all data?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        TextButton(
          onPressed: () async {
            await dbBaby.cleanBabyData();
            Get.offAllNamed('/nameSex');
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  aboutBabyUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/launcher.webp',
        width: 72,
        height: 72,
      ),
      children: [
        const Text(
            """We can record your child's height, weight, head circumference and get a reference value"""),
      ],
      context: context,
    );
  }

}
