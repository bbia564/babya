import 'package:get/get.dart';

import '../baby_first/baby_first_logic.dart';
import '../baby_second/baby_second_logic.dart';
import 'baby_tab_logic.dart';

class BabyTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BabyTabLogic());
    Get.lazyPut(() => BabyFirstLogic());
    Get.lazyPut(() => BabySecondLogic());
  }
}
