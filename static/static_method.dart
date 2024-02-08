//Static method can be called directly on the class without needing to create an instance of the class.
class MathFunc {
 static int multiply(int a, int b) {
    return a * b;
 }
 
 static int addAll(List<int> numbers) {
    int sum = 0;
    for (int i in numbers) {
        sum = sum + i;
    }
    return sum;
 }
}
void main() {
 // Calling static method without creating an instance
 //static cannot be accessed by an instance.
 print(MathFunc.multiply(5, 10)); 
 
 List<int> numbers = [1, 2, 3, 4, 5];
 print(MathFunc.addAll(numbers));
}