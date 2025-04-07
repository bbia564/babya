import 'package:baby_info/main.dart';
import 'package:baby_info/pages/name_sex/baby_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'name_sex_logic.dart';

class NameSexPage extends GetView<NameSexLogic> {
  const NameSexPage({super.key});

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
        child: SafeArea(
            child: GetBuilder<NameSexLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Text(
                controller.isEdit ? 'Edit Baby information' : 'Add baby information',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              <Widget>[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Baby name',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 40,
                      child: BabyTextField(
                          value: controller.name,
                          maxLength: 15,
                          onChange: (v) {
                            controller.name = v;
                          }),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Date of birth',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 40,
                      color: Colors.transparent,
                      child: IgnorePointer(
                        child: <Widget>[
                          Expanded(
                              child: BabyTextField(
                                  hintText: 'Select Date',
                                  value: controller.birthdayStr,
                                  onChange: (_) {})),
                          const Icon(
                            Icons.keyboard_arrow_right,
                            size: 25,
                            color: Colors.grey,
                          )
                        ].toRow(),
                      ),
                    ).gestures(onTap: () {
                      controller.birthdaySelected();
                    }),
                    Divider(
                      height: 10,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Sex',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 40,
                      color: Colors.transparent,
                      child: IgnorePointer(
                        child: <Widget>[
                          Expanded(
                              child: BabyTextField(
                                  hintText: 'Select sex',
                                  value: controller.sexStr,
                                  onChange: (_) {})),
                          const Icon(
                            Icons.keyboard_arrow_right,
                            size: 25,
                            color: Colors.grey,
                          )
                        ].toRow(),
                      ),
                    ).gestures(onTap: () {
                      controller.sexSelected();
                    }),
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
                      child: const Text('Next',
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
                )
                    .decorated(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white)
                    .marginOnly(top: 44),
                ClipRRect(
                  borderRadius: BorderRadius.circular(44),
                  child: Container(
                    width: 88,
                    height: 88,
                    child: controller.photo == null
                        ? const Icon(
                            Icons.add,
                            size: 32,
                            color: Colors.white,
                          )
                        : Image.memory(controller.photo!, fit: BoxFit.fill),
                  )
                      .decorated(
                          borderRadius: BorderRadius.circular(44),
                          border: Border.all(color: Colors.white, width: 2),
                          color: const Color(0xffededed))
                      .gestures(onTap: () {
                    controller.imageSelected();
                  }),
                )
              ].toStack(alignment: Alignment.topCenter)
            ].toColumn(),
          );
        }).marginAll(15)),
      ),
    );
  }
}
