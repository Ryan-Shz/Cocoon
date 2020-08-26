import 'package:flutter_app/dart/oop.dart';

// Dart操作符示例示例
class Operator {
  void test() {
    var num = 7;
    // 除3
    print(num / 3); // 结果是2.3333..
    // 整除3
    print(num ~/ 3); // 结果是2
    // 求余
    print(num % 3); // 结果是1

    // ??= 表示: 如果为null则等于
    var name = "Ryan";
    print(name);
    name = null;
    name ??= "Shz";
    print(name); // Shz

    // ??表示： 如果为null则为
    name = null;
    var result = name ?? "Ryan-Shz";
    print(result); // Ryan-Shz

    // 联级语法
    Person("name", 1)
      ..age = 2
      ..hello()
      ..name = 'Ryan';

    // 常量构造方法，可以保证相同参数构造出来的对象是同一个对象
    Teacher teacher1 = const Teacher(school: 'Harvard');
    Teacher teacher2 = const Teacher(school: 'Harvard');
    print(identical(teacher1, teacher2));

    // 创建和使用枚举
    // 枚举有两个属性，index和values
    print(MyColors.blue.index);
    print(MyColors.values);
  }
}

// 创建枚举
enum MyColors { red, blue, green }

// implements可以实现多个类，但是必须实现该类的所有方法
class SuperMan implements Runner, Flyable {
  @override
  fly() {
    // TODO: implement fly
    throw UnimplementedError();
  }

  @override
  run() {
    // TODO: implement run
    throw UnimplementedError();
  }

}

// mixin则不需要实现类中的所有方法，可以复用原有类中的逻辑
// 比如Flyable类的fly方法
class SuperMan2 with Runner, Flyable {
  @override
  run() {
    // TODO: implement run
    throw UnimplementedError();
  }
}

// 也可以定义为mixin来替代abstract class
abstract class Runner {
  run();
}

// 也可以定义为mixin来替代abstract class
mixin Flyable {
  fly() {
    print('i am flying');
  }
}
