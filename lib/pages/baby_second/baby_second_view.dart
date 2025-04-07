import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'baby_second_logic.dart';

class BabySecondPage extends GetView<BabySecondLogic> {
  const BabySecondPage({super.key});

  Widget _item(int index, BuildContext context) {
    final titles = [
      'Fill in the information again',
      'Clean all data',
      'About us'
    ];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(titles[index]),
        index == 2 ? Container(
          padding: const EdgeInsets.only(right: 6),
          child: const Text("v.1.0.0"),
        ) : const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: Colors.grey,
        )
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          Get.toNamed('/nameSex',arguments: true);
          break;
        case 1:
          controller.cleanBabyData();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            Container(
              padding: const EdgeInsets.all(12),
              child: <Widget>[
                _item(0, context),
                _item(1, context),
                _item(2, context)
              ].toColumn(
                  separator: Divider(
                height: 15,
                color: Colors.grey.withOpacity(0.3),
              )),
            ).decorated(
                color: Colors.white, borderRadius: BorderRadius.circular(12))
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
