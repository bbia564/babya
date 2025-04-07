import 'package:baby_info/db_baby/db_baby.dart';
import 'package:baby_info/pages/baby_first/baby_first_logic.dart';
import 'package:baby_info/pages/baby_first/baby_first_view.dart';
import 'package:baby_info/pages/baby_second/baby_second_view.dart';
import 'package:baby_info/pages/height_weight/height_weight_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';
import 'baby_tab_logic.dart';

class BabyTabPage extends GetView<BabyTabLogic> {
  const BabyTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [BabyFirstPage(), HeightWeightPage(), BabySecondPage()],
      ),
      bottomNavigationBar: Obx(() => _navBabyBars()),
    );
  }

  Widget _navBabyBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/item0Grey.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          activeIcon: Image.asset(
            'assets/item0Light.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_circle,
            color: primaryColor,
            size: 40,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/item1Grey.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          activeIcon: Image.asset(
            'assets/item1Light.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) async {
        if (index == 1) {
          var entity = await Get.find<DBBaby>().getBabyData();
          Get.toNamed('/heightWeight',
              arguments: entity, parameters: {'isEdit': '1'})?.then((_) {
            BabyFirstLogic firstLogic = Get.put(BabyFirstLogic());
            firstLogic.getData();
          });
        } else {
          controller.currentIndex.value = index;
          controller.pageController.jumpToPage(index);
        }
      },
    );
  }
}
