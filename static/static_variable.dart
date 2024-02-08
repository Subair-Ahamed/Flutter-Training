class MyClass {
  //Static variables are initialized only once, and
  // they retain their values throughout the program's execution.
  static int staticVar = 10;

  void printStaticVar() {
    print('Static variable: $staticVar');
  }
}

void main() {
  print(MyClass.staticVar); // Accessing static variable directly
  var obj1 = MyClass();
  var obj2 = MyClass();
  obj1.printStaticVar(); // Output: Static variable: 10
  obj2.printStaticVar();
}
