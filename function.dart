void main() {  
  print("Add two number using function:");    
  
  int sum(int a, int b){   //syntax: return-type func_name(arguments){statements}
            int c;  
            c = a+b;  
            return c;  
}  

var result = sum(30,20);  //func call
print("The sum of two numbers is: $result");  
}  