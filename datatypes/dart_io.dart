import 'dart:io';

void main(){
  var name,age;
  print("Enter Name and Age:");
  name=stdin.readLineSync(); //stdin.readLineSync() is used to read inptu as a string
  age=stdin.readLineSync(); 
  age=num.parse(age);  //num.parse is used to convert string into num.

  stdout.write("Name : $name | Age : $age\n"); //stdout.write() is similar to print.
  print(name.runtimeType); 
  print(age.runtimeType);
}