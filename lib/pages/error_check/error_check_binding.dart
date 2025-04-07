import 'package:get/get.dart';

import 'error_check_logic.dart';

class ErrorCheckBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
