import 'package:baby_info/db_baby/baby_entity.dart';
import 'package:baby_info/db_baby/db_baby.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HeightWeightLogic extends GetxController {

  DBBaby dbBaby = Get.find();

  bool isEdit = false;

  BabyEntity entity = Get.arguments;

  String height = '';
  String weight = '';
  String head = '';

  void save() async {
    if (height.isEmpty || weight.isEmpty || head.isEmpty) {
      Fluttertoast.showToast(msg: 'Please fill in all fields');
      return;
    }
    num heightNum = num.parse(height);
    num weightNum = num.parse(weight);
    num headNum = num.parse(head);
    if (heightNum <= 0 || weightNum <= 0 || headNum <= 0) {
      Fluttertoast.showToast(msg: 'Please input valid number');
      return;
    }
    height = heightNum.toString();
    weight = weightNum.toString();
    head = headNum.toString();
    update();
    entity.height = height;
    entity.weight = weight;
    entity.head = head;
    entity.createdTime = DateTime.now();
    final oldEntity = await dbBaby.getBabyData();
    if (oldEntity != null) {
      entity.id = oldEntity!.id;
      await dbBaby.updateBaby(entity);
      print(1);
    } else {
      await dbBaby.insertBaby(entity);
    }
    Get.offAllNamed('/babyTab');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if (entity != null) {
      isEdit = Get.parameters['isEdit'] == '1';
    }
    super.onInit();
  }

}
