import 'package:get/get.dart';

import 'height_weight_logic.dart';

class HeightWeightBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HeightWeightLogic());
  }
}
