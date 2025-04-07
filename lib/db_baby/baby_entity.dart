import 'dart:typed_data';

import 'package:baby_info/main.dart';
import 'package:intl/intl.dart';

class BabyEntity {
  int id;
  DateTime createdTime;
  Uint8List photo;
  String name;
  DateTime birthday;
  int sex;//0 girl 1 boy
  String height;
  String weight;
  String head;

  BabyEntity({
    required this.id,
    required this.createdTime,
    required this.photo,
    required this.name,
    required this.birthday,
    required this.sex,
    required this.height,
    required this.weight,
    required this.head,
  });

  factory BabyEntity.fromJson(Map<String, dynamic> json) {
    return BabyEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      photo: json['photo'],
      name: json['name'],
      birthday: DateTime.parse(json['birthday']),
      sex: json['sex'],
      height: json['height'],
      weight: json['weight'],
      head: json['head'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'photo': photo,
      'name': name,
      'birthday': birthday.toIso8601String(),
      'sex': sex,
      'height': height,
      'weight': weight,
      'head': head,
    };
  }

  String get birthdayStr => DateFormat('MM/dd/yyyy').format(birthday);

  String get createdTimeStr {
    var result = '';
    final now = DateTime.now();
    final diff = now.difference(createdTime);
    if (diff.inDays == 0) {
      result = DateFormat('HH:mm').format(createdTime);
    } else if (diff.inDays < 5) {
      result = '${diff.inDays} days ago';
    } else if (diff.inDays < 30) {
      result = '${diff.inDays ~/ 7} weeks ago';
    } else {
      result = DateFormat('MM/dd/yyyy').format(createdTime);
    }
    return result;
  }

  int get monthOld {
  final now = DateTime.now();
    int months = (now.year - birthday.year) * 12 + now.month - birthday.month;
    if (now.day < birthday.day) {
      months--;
    }
    return months;
  }

  String get heightStandard {
    final height = double.parse(this.height);
    final min = heightRangeData[monthOld][1];
    final max = heightRangeData[monthOld][2];
    if (height < min) {
      return 'Low';
    } else if (height > max) {
      return 'High';
    }
    return 'Normal';
  }

  String get weightStandard {
    final weight = double.parse(this.weight);
    final min = weightRangeData[monthOld][1];
    final max = weightRangeData[monthOld][2];
    if (weight < min) {
      return 'Low';
    } else if (weight > max) {
      return 'High';
    }
    return 'Normal';
  }

  String get headStandard {
    final head = double.parse(this.head);
    final min = headRangeData[monthOld][1];
    final max = headRangeData[monthOld][2];
    if (head < min) {
      return 'Low';
    } else if (head > max) {
      return 'High';
    }
    return 'Normal';
  }

}