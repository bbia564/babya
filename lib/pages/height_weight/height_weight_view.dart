import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import '../name_sex/baby_text_field.dart';
import 'height_weight_logic.dart';

class HeightWeightPage extends GetView<HeightWeightLogic> {
  const HeightWeightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
        leading: controller.isEdit
            ? const Icon(
          Icons.arrow_back_ios_rounded,
          size: 25,
          color: Colors.black,
        ).gestures(onTap: () {
          Get.back();
        })
            : null,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(child: GetBuilder<HeightWeightLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Text(
                controller.isEdit ? 'Edit Baby Info' : 'Record information for the first time',
                textAlign: TextAlign.center,
                style:const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ).marginSymmetric(horizontal: 30),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: <Widget>[
                  const Text(
                    'Height',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                    child: <Widget>[
                      Expanded(
                          child: BabyTextField(
                              value: controller.height,
                              isNumber: true,
                              maxLength: 3,
                              onChange: (v) {
                                controller.height = v;
                              })),
                      const Text('cm')
                    ].toRow(),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Weight',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                    child: <Widget>[
                      Expanded(
                          child: BabyTextField(
                              value: controller.weight,
                              isNumber: true,
                              maxLength: 3,
                              onChange: (v) {
                                controller.weight = v;
                              })),
                      const Text('kg')
                    ].toRow(),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Head',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                    child: <Widget>[
                      Expanded(
                          child: BabyTextField(
                              value: controller.head,
                              isNumber: true,
                              maxLength: 3,
                              onChange: (v) {
                                controller.head = v;
                              })),
                      const Text('cm')
                    ].toRow(),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text('Done',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  )
                      .decorated(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15))
                      .gestures(onTap: () {
                    controller.save();
                  })
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ).decorated(
                  borderRadius: BorderRadius.circular(20), color: Colors.white)
            ].toColumn(),
          ).marginAll(15);
        })),
      ),
    );
  }
}
