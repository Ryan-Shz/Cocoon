/// 定义一个Dart类，所有类都继承于Object
class Person {
  String name;
  int age;

  // 标准构造方法
  Person(this.name, this.age);

  @override
  String toString() {
    // TODO: implement toString
    return "name: $name, age: $age";
  }

  // 指定默认参数的方法
  eat(String food, {int num = 0}) {
    print('eating $food, num is $num');
  }

  // 声明常量
  static final a = 1;

  // [] 是位置可选参数
  // {} 是命名可选参数
  hello([String word = "hello world"]) {
    const int a = 1;
  }

}

class Student extends Person {
  /// 下划线开头表示私有变量
  String _school;
  String city;
  String country;
  String name;

  /// {}里的变量表示可选参数，加上=可以添加默认参数
  Student(String name, int age, this._school, {this.city, this.country = "中国"})
      :
        // 初始化列表
        name = "$country.$city",
        super(name, age) {
    // 构造方法体，做一些初始化操作
    print(name);
  }

  // 命名构造方法
  Student.cover(Student stu) : super(stu.name, stu.age);

  // 命名工厂构造方法, factory [类名 + "." + 方法名]
  factory Student.stu(Student stu) {
    return Student(stu.name, stu.age, stu._school);
  }

  // Get方法的写法
  String get school => _school;

  // Set方法的写法
  set school(String school) {
    this._school = school;
  }

  // 静态方法的写法
  static void say(String message) {
    print(message);
  }
}

class Logger {
  static Logger _cache;

  // 工厂构造方法
  // 不仅仅是构造方法，更是一种模式
  // 可以理解为是一种单例
  factory Logger() {
    if (_cache == null) {
      _cache = Logger._internal();
    }
    return _cache;
  }

  Logger._internal();

  void log(String msg) {
    print(msg);
  }
}

// 定义一个抽象类
abstract class Study {
  // 可以包含没有方法体的方法
  // 声明一个抽象方法
  void study();
}

class FlutterStudy extends Study {
  @override
  void study() {
    print("learning flutter");
  }
}

// mixins
class Test extends Person with Study {
  Test(String name, int age) : super(name, age);

  @override
  void study() {
    // TODO: implement study
  }
}

// 创建一个泛型类
class Cache<T> {
  static final Map<String, Object> _cache = Map();

  void setItem(String key, T t) {
    _cache[key] = t;
  }

  T getItem(String key) {
    return _cache[key];
  }
}
