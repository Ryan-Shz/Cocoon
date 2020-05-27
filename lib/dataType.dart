import 'package:flutter/material.dart';

/// Dart常用数据类型
class DataType extends StatefulWidget {
  @override
  _DataTypeState createState() => new _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    _numberType();
    _stringType();
    _booleanType();
    _listType();
    _mapType();
    return new Container(
      child: Text("常用数据类型"),
    );
  }

  void _numberType() {
    // num，接收浮点类型和整型的数字
    num num1 = 1.0;
    num num2 = 2;
    // int还能是整数
    int int1 = 3;
    // double是双精度
    double d1 = 1.68;
    print("num1: $num1");
    print(num1.toInt());
  }

  void _stringType() {
    String str1= "字符串1";
    String str2 = '字符串2';
    String merge = str1 + str2;
    String merge1 = "str1: $str1 str2: $str2";
    print(merge);
    print(merge1);
  }

  void _booleanType() {
    bool b1 = true;
    bool b2 = false;
    print(b1 || b2);
    print(b1 && b2);
  }

  void _listType() {
    List<String> list = new List();
    List<String> list1 = ["集合"];
    List<int> list2 = List.generate(3, (index) => index*2);

    list.add("1");
    list.addAll(list1);
    // 第一种遍历方式
    for (int i=0; i<list.length; i++) {
      print(list[i]);
    }
    // 第二种遍历方式
    for (String s in list) {
      print(s);
    }
    // 第三种遍历方式
    list.forEach((element) {
      print(element);
    });
    list2.forEach((element) {
      print(element);
    });
  }

  void _mapType() {
    // 构造方式
    Map<String, String> names = {"小明": "xiaoming"};
    Map<String, int> ages = new Map();
    // 添加数据的方式
    ages['小明'] = 16;

    print(names);
    print(ages);

    // 遍历方式1
    names.forEach((key, value) {
      print("key: $key value: $value");
    });
    // 遍历方式2
    Map names2 = names.map((key, value) {
      return MapEntry(value, key);
    });
    print(names2);
    // 遍历方式3
    for (var key in names.keys) {
      print("key: $key, value: ${names[key]}");
    }
  }
}
