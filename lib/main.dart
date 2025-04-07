import 'package:baby_info/db_baby/db_baby.dart';
import 'package:baby_info/pages/baby_first/baby_first_binding.dart';
import 'package:baby_info/pages/baby_first/baby_first_view.dart';
import 'package:baby_info/pages/baby_second/baby_second_binding.dart';
import 'package:baby_info/pages/baby_second/baby_second_view.dart';
import 'package:baby_info/pages/baby_tab/baby_tab_binding.dart';
import 'package:baby_info/pages/baby_tab/baby_tab_view.dart';
import 'package:baby_info/pages/error_check/error_check_binding.dart';
import 'package:baby_info/pages/error_check/error_check_view.dart';
import 'package:baby_info/pages/error_page/error_page_binding.dart';
import 'package:baby_info/pages/error_page/error_page_view.dart';
import 'package:baby_info/pages/height_weight/height_weight_binding.dart';
import 'package:baby_info/pages/height_weight/height_weight_view.dart';
import 'package:baby_info/pages/name_sex/baby_template.dart';
import 'package:baby_info/pages/name_sex/name_sex_binding.dart';
import 'package:baby_info/pages/name_sex/name_sex_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color primaryColor = const Color(0xffff8e52);
Color bgColor = const Color(0xfff8f8f8);

List<String> sexList = ['Female', 'Male'];

const heightRangeData = [
  [0, 49.1, 53.9],
  [1, 52.1, 57.1],
  [2, 55.5, 60.7],
  [3, 58.5, 63.7],
  [4, 61.8, 66.8],
  [5, 64.2, 69.4],
  [6, 65.7, 70.3],
  [7, 67.3, 72.1],
  [8, 69.0, 74.0],
  [9, 70.4, 75.6],
  [10, 71.8, 77.2],
  [11, 73.2, 78.6],
  [12, 74.0, 80.0],
  [13, 75.5, 81.3],
  [14, 77.0, 82.8],
  [15, 78.4, 84.2],
  [16, 79.8, 85.6],
  [17, 81.2, 87.0],
  [18, 80.5, 86.5],
  [19, 81.8, 87.8],
  [20, 83.0, 89.2],
  [21, 84.2, 90.6],
  [22, 85.3, 91.9],
  [23, 86.4, 93.0],
  [24, 85.5, 91.5],
  [25, 86.6, 92.8],
  [26, 87.7, 94.1],
  [27, 88.8, 95.4],
  [28, 89.9, 96.7],
  [29, 91.0, 98.0],
  [30, 90.0, 97.0],
  [31, 91.2, 98.4],
  [32, 92.4, 99.8],
  [33, 93.6, 101.2],
  [34, 94.8, 102.6],
  [35, 96.0, 104.0],
  [36, 97.2, 105.4],
  [37, 98.4, 107.6],
  [38, 99.6, 109.8],
  [39, 100.8, 112.0],
  [40, 102.0, 114.2],
  [41, 103.2, 116.4],
  [42, 104.4, 118.6],
  [43, 105.6, 120.8],
  [44, 106.8, 123.0],
  [45, 108.0, 125.2],
  [46, 107.8, 113.2],
  [47, 108.5, 114.8],
  [48, 108.3, 114.0],
  [49, 108.8, 114.6],
  [50, 109.3, 115.2],
  [51, 109.9, 116.0],
  [52, 110.3, 116.6],
  [53, 110.8, 117.2],
  [54, 109.7, 116.8],
  [55, 110.2, 117.4],
  [56, 110.7, 118.0],
  [57, 111.2, 118.8],
  [58, 111.7, 119.4],
  [59, 112.2, 120.9],
  [60, 112.7, 121.2],
  [61, 113.2, 122.6],
  [62, 113.7, 124.0],
  [63, 114.2, 125.4],
  [64, 114.7, 126.8],
  [65, 115.2, 128.2],
  [66, 115.7, 129.6],
  [67, 116.2, 131.0],
  [68, 116.7, 132.4]
];

const weightRangeData = [
  [0, 2.7, 3.9],
  [1, 3.3, 4.7],
  [2, 4.1, 5.7],
  [3, 4.8, 6.6],
  [4, 5.5, 7.3],
  [5, 6.0, 8.0],
  [6, 6.6, 8.8],
  [7, 7.1, 9.5],
  [8, 7.6, 10.2],
  [9, 7.8, 10.2],
  [10, 8.1, 10.7],
  [11, 8.4, 11.2],
  [12, 8.5, 11.5],
  [13, 8.8, 11.8],
  [14, 9.1, 12.3],
  [15, 9.4, 12.8],
  [16, 9.7, 13.3],
  [17, 10.0, 13.8],
  [18, 9.8, 13.2],
  [19, 10.2, 13.8],
  [20, 10.6, 14.4],
  [21, 11.0, 15.0],
  [22, 11.4, 15.6],
  [23, 11.8, 16.2],
  [24, 11.0, 15.0],
  [25, 11.5, 15.7],
  [26, 12.0, 16.4],
  [27, 12.5, 17.1],
  [28, 13.0, 17.8],
  [29, 13.5, 18.5],
  [30, 12.5, 16.5],
  [31, 13.0, 17.3],
  [32, 13.5, 18.1],
  [33, 14.0, 18.9],
  [34, 14.5, 19.7],
  [35, 15.0, 20.5],
  [36, 14.5, 20.8],
  [37, 15.0, 21.5],
  [38, 15.5, 22.2],
  [39, 16.0, 22.9],
  [40, 16.5, 23.6],
  [41, 17.0, 24.3],
  [42, 17.5, 25.0],
  [43, 18.0, 25.7],
  [44, 18.5, 26.4],
  [45, 19.0, 27.1],
  [46, 16.5, 23.8],
  [47, 17.0, 25.3],
  [48, 17.5, 26.1],
  [49, 18.0, 26.8],
  [50, 18.5, 27.5],
  [51, 19.0, 28.2],
  [52, 19.5, 28.9],
  [53, 20.0, 29.6],
  [54, 20.5, 30.3],
  [55, 21.0, 31.0],
  [56, 21.5, 31.7],
  [57, 22.0, 32.4],
  [58, 19.5, 31.2],
  [59, 20.5, 32.2],
  [60, 21.5, 32.9],
  [61, 22.0, 33.6],
  [62, 22.5, 34.2],
  [63, 23.0, 34.8],
  [64, 23.5, 35.4],
  [65, 24.0, 36.0],
  [66, 24.5, 36.6],
  [67, 25.0, 37.2],
  [68, 23.5, 35.9]
];

const headRangeData = [
  [0, 32.7, 36.3],
  [1, 34.5, 38.1],
  [2, 36.3, 40.1],
  [3, 38.0, 42.0],
  [4, 39.5, 43.3],
  [5, 40.8, 44.8],
  [6, 41.0, 45.0],
  [7, 41.8, 45.8],
  [8, 42.5, 46.5],
  [9, 43.0, 47.0],
  [10, 43.5, 47.5],
  [11, 44.0, 48.0],
  [12, 44.5, 48.5],
  [13, 45.0, 49.0],
  [14, 45.4, 49.4],
  [15, 45.8, 49.8],
  [16, 46.2, 50.2],
  [17, 46.6, 50.6],
  [18, 46.0, 50.0],
  [19, 46.4, 50.4],
  [20, 46.8, 50.8],
  [21, 47.2, 51.2],
  [22, 47.5, 51.5],
  [23, 47.8, 51.8],
  [24, 47.0, 51.0],
  [25, 48.0, 52.0],
  [26, 48.4, 52.4],
  [27, 48.9, 53.9],
  [28, 49.3, 54.3],
  [29, 49.7, 54.7],
  [30, 50.0, 55.0],
  [31, 50.4, 55.4],
  [32, 50.8, 55.8],
  [33, 51.2, 56.2],
  [34, 51.6, 56.6],
  [35, 52.0, 57.0],
  [36, 52.4, 57.4],
  [37, 52.9, 57.9],
  [38, 53.3, 58.3],
  [39, 53.7, 58.7],
  [40, 54.1, 59.1],
  [41, 54.5, 59.5],
  [42, 54.9, 59.9],
  [43, 55.3, 60.3],
  [44, 55.7, 60.7],
  [45, 56.1, 61.1],
  [46, 56.5, 61.5],
  [47, 57.0, 62.0],
  [48, 57.4, 62.4],
  [49, 57.8, 63.8],
  [50, 58.1, 64.1],
  [51, 58.5, 64.5],
  [52, 58.9, 64.9],
  [53, 59.3, 65.3],
  [54, 59.7, 65.7],
  [55, 60.1, 66.1],
  [56, 60.5, 66.5],
  [57, 61.0, 67.0],
  [58, 61.5, 67.5],
  [59, 62.0, 68.0],
  [60, 62.5, 68.5],
  [61, 63.0, 69.0],
  [62, 63.5, 69.5],
  [63, 64.0, 70.0],
  [64, 64.5, 70.5],
  [65, 64.9, 70.9],
  [66, 65.0, 71.0],
  [67, 65.5, 71.5],
  [68, 65.9, 71.9],
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBBaby().init());
  final babyInfo = await Get.find<DBBaby>().getBabyData();
  runApp(MyApp(
    hadData: babyInfo != null,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({this.hadData = false, super.key});

  final bool hadData;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Babys,
      initialRoute: '/',
      //hadData ? '/babyTab' : '/nameSex'
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}

List<GetPage<dynamic>> Babys = [
  GetPage(name: '/', page: () => const ErrorCheckView(), binding: ErrorCheckBinding()),
  GetPage(name: '/nameSex', page: () => const NameSexPage(), binding: NameSexBinding()),
  GetPage(name: '/heightWeight', page: () => const HeightWeightPage(), binding: HeightWeightBinding()),
  GetPage(name: '/babyTab', page: () => const BabyTabPage(), binding: BabyTabBinding()),
  GetPage(name: '/babyTemplate', page: () => const BabyTemplate()),
  GetPage(name: '/babySecond', page: () => const BabySecondPage(), binding: BabySecondBinding()),
  GetPage(name: '/babyFirst', page: () => const BabyFirstPage(), binding: BabyFirstBinding()),
  GetPage(name: '/errorPage', page: () => const ErrorPageView(), binding: ErrorPageBinding()),
];
