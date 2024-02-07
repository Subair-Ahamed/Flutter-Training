//Dart Variables:
//syntax : type variable_name;
//Rules:
// Variable name or identifiers can’t be the keyword.
// Variable name or identifiers can contain alphabets and numbers.
// Variable name or identifiers can’t contain spaces and special characters, except the underscore(_) and the dollar($) sign.
// Variable name or identifiers can’t begin with number. 

void main(){

  num a = 15; //takes both int and double value
  int x = 12;
  double y = 13.2;
  String input = "Dart Variables";
  bool isValid = true;

  print(a);
  print(x);
  print(y);
  print(input);
  print(isValid);

  dynamic value = "Hello Dart"; //can store implicitly any value during running the program.

  final ans1 = "const variable without datatype";//final and const keywords are used to define constant variable in Dart
  final String ans2 = "constant with datatype";

  print(value);
  print(ans1);
  print(ans2);
}
