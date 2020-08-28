// Flutter编程小技巧
class Tips {
  void main() {
    // 安全调用
    // 对于不确定性是否为空的对象可以通过?.的方式来调用它的属性和方法，以防空指针
    List list;
    print(list?.length);
    // 设置默认值0，使用??
    print(list?.length??0);
  }
}
