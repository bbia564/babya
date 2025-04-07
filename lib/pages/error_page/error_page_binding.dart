import 'package:get/get.dart';

import 'error_page_logic.dart';

class ErrorPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoNetworkLogic());
  }
}
