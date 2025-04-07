import 'package:get/get.dart';

import 'baby_first_logic.dart';

class BabyFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BabyFirstLogic());
  }
}
