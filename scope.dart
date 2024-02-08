//Global Scope:
//You can define a variable in the global scope to use the variable anywhere in your program.
String global = "I am Global variable";

int add(int a,int b){ //global can be accessed anywhere
  return a+b;
}

void main() {
  print(global);

  //Method Scope:
  //If you created variables inside the method, you can use them inside the method block but not outside the method block.
  String text = "I am local variable";
  print(text);

  int sub(int x, int y){ //accessed only within the scope
    return x-y;
  }

  var c = add(2,3);
  print(c);

  var z = sub(5,2);
  print(z);
}

