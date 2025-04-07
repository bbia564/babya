import 'package:get/get.dart';

import 'baby_second_logic.dart';

class BabySecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BabySecondLogic());
  }
}
