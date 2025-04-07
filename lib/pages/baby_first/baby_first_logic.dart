import 'package:baby_info/db_baby/baby_entity.dart';
import 'package:get/get.dart';

import '../../db_baby/db_baby.dart';

class BabyFirstLogic extends GetxController {

  DBBaby dbBaby = Get.find();

  BabyEntity? babyInfo;

  void getData() async {
    babyInfo = await dbBaby.getBabyData();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
