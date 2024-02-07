void main(){
  int num1 = 5;
  int num2 = 10;
  int num3 = num1 +num2;
  print("The answer is $num3");

  double x = 10.5;
  double y = 12.2;
  double z = y -x;
  print("the answer is ${z.round()}"); //rounds the float value

  //var keyword is used for declaring variables with implicit type inference
  var inp1 = "5";
  print(inp1.runtimeType); //it shows the type of value stored.
  var inp2 = num.parse(inp1); //num.parse(input) used parsing a string containing numeric literal and convert to the number.
  print(inp2);
}

//Properties:
// hashcode: This property is used to get the hash code of the given number.
// isFinite: If the given number is finite, then this property will return true.
// isInfinite: If the number is infinite, then this property will return true.
// isNan: If the number is non-negative then this property will return true.
// isNegative: If the number is negative then this property will return true.
// isEven: If the given number is an even then this property will return true.
// isOdd: If the given number is odd then this property will return true.

//Methods:
// abs(): This method gives the absolute value of the given number.
// ceil(): This method gives the ceiling value of the given number.
// floor(): This method gives the floor value of the given number.
// compareTo(): This method compares the value with other numbers.
// remainder(): This method gives the truncated remainder after dividing the two numbers.
// round(): This method returns the round of the number.
// toDouble(): This method gives the double equivalent representation of the number.
// toInt(): This method returns the integer equivalent representation of the number.
// toString(): This method returns the String equivalent representation of the number