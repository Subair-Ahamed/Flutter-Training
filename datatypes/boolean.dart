

void main() {
  String str1 = 'i miss'; 
  String str2 = 'Golang'; 
  bool val = (str1==str2); //checks the condition
  print (val);  
  print(val.runtimeType);

  int a = 5;
  int b = 7;
  var result = a>b ? "a is greater" : "b is greater"; //'?' executes if true, ':' executes if false
  print(result);
}