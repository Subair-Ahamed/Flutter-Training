import 'dart:io';

int factorial(int num){  
    
  //base case of recursion.   
  if(num <= 1) { 
     return 1;  
  }  
  else {  
     return num*factorial(num-1);    //function call itself.  
  }  
}  
void main() {  
  var num;
  print("Enter the number:");
  num = stdin.readLineSync();
  num=int.parse(num);

  var fact = factorial(num);  
  print("Factorial Of $num is: $fact");  
} 