import 'package:baby_info/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'baby_first_logic.dart';

class BabyFirstPage extends GetView<BabyFirstLogic> {
  const BabyFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<BabyFirstLogic>(
                init: BabyFirstLogic(),
                builder: (_) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        child: <Widget>[
                          <Widget>[
                            Container(
                              width: 8,
                              height: 8,
                            ).decorated(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(4)),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Baby information',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          ].toRow(),
                          const SizedBox(
                            height: 10,
                          ),
                          <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                width: 60,
                                height: 60,
                                child: controller.babyInfo == null
                                    ? null
                                    : Image.memory(
                                        controller.babyInfo!.photo,
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.fill,
                                      ),
                              ).decorated(color: const Color(0xffe5e5e5)),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                                child: <Widget>[
                              Expanded(
                                  child: <Widget>[
                                const Text(
                                  'Name',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  controller.babyInfo?.name ?? '-',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ].toColumn(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start)),
                              Expanded(
                                  child: <Widget>[
                                const Text(
                                  'Date of birth',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  controller.babyInfo?.birthdayStr ?? '-',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ].toColumn(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start))
                            ].toRow())
                          ].toRow()
                        ].toColumn(
                            crossAxisAlignment: CrossAxisAlignment.start),
                      ).decorated(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        child: <Widget>[
                          <Widget>[
                            Container(
                              width: 8,
                              height: 8,
                            ).decorated(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(4)),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Latest record',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              controller.babyInfo?.createdTimeStr ?? '-',
                              style:const TextStyle(color: Colors.grey),
                            )
                          ].toRow(),
                          Divider(
                            height: 25,
                            color: Colors.grey.shade300,
                          ),
                          <Widget>[
                            controller.babyInfo == null
                                ? const SizedBox(
                                    width: 148,
                                    height: 148,
                                  )
                                : Image.asset(
                                    'assets/icon${controller.babyInfo?.sex ?? 0}.webp',
                                    width: 148,
                                    height: 148,
                                    fit: BoxFit.cover,
                                  ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: <Widget>[
                              const Text(
                                'Height',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              <Widget>[
                                Text(
                                  '${controller.babyInfo?.height ?? '-'} cm',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 50,
                                  height: 28,
                                  alignment: Alignment.center,
                                  child: Text(
                                    controller.babyInfo?.heightStandard ?? '-',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ).decorated(
                                    borderRadius: BorderRadius.circular(14),
                                    color:
                                        controller.babyInfo?.heightStandard ==
                                                'Normal'
                                            ? const Color(0xff57e545)
                                            : Colors.grey.shade300)
                              ].toRow(),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'Weight',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              <Widget>[
                                Text(
                                  '${controller.babyInfo?.weight ?? '-'} kg',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 50,
                                  height: 28,
                                  alignment: Alignment.center,
                                  child: Text(
                                    controller.babyInfo?.weightStandard ?? '-',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ).decorated(
                                    borderRadius: BorderRadius.circular(14),
                                    color:
                                        controller.babyInfo?.weightStandard ==
                                                'Normal'
                                            ? const Color(0xff57e545)
                                            : Colors.grey.shade300)
                              ].toRow(),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'Head',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              <Widget>[
                                Text(
                                  '${controller.babyInfo?.head ?? '-'} cm',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 50,
                                  height: 28,
                                  alignment: Alignment.center,
                                  child: Text(
                                    controller.babyInfo?.headStandard ?? '-',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ).decorated(
                                    borderRadius: BorderRadius.circular(14),
                                    color: controller.babyInfo?.headStandard ==
                                            'Normal'
                                        ? const Color(0xff57e545)
                                        : Colors.grey.shade300)
                              ].toRow(),
                            ].toColumn(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start))
                          ].toRow(),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            child: <Widget>[
                              const Text(
                                'Current age reference',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              <Widget>[
                                const Text(
                                  'Height',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                Text(
                                    '${heightRangeData[controller.babyInfo?.monthOld ?? 0][1]} - ${heightRangeData[controller.babyInfo?.monthOld ?? 0][2]} cm')
                              ].toRow(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween),
                              const SizedBox(
                                height: 10,
                              ),
                              <Widget>[
                                const Text(
                                  'Weight',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                Text(
                                    '${weightRangeData[controller.babyInfo?.monthOld ?? 0][1]} - ${weightRangeData[controller.babyInfo?.monthOld ?? 0][2]} kg')
                              ].toRow(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween),
                              const SizedBox(
                                height: 10,
                              ),
                              <Widget>[
                                const Text(
                                  'Head',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                Text(
                                    '${headRangeData[controller.babyInfo?.monthOld ?? 0][1]} - ${headRangeData[controller.babyInfo?.monthOld ?? 0][2]} cm')
                              ].toRow(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween),
                            ].toColumn(
                                crossAxisAlignment: CrossAxisAlignment.start),
                          ).decorated(
                              color: const Color(0xfffafafa),
                              borderRadius: BorderRadius.circular(20))
                        ].toColumn(
                            crossAxisAlignment: CrossAxisAlignment.start),
                      ).decorated(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20))
                    ].toColumn(),
                  );
                }).marginAll(15)),
      ),
    );
  }
}
