import 'package:get/get.dart';

import 'name_sex_logic.dart';

class NameSexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NameSexLogic());
  }
}
