class Student {
  final String? name; //? is a variable may be null.
  final int? age;
  final int? rollNumber;

  // Constant Constructor is used to create a object whose value cannot be changed. 
  const Student({this.name, this.age, this.rollNumber}); 
}

void main() {
  // Here student is object of Student.
  var student = const Student(name: "John", age: 20, rollNumber: 1);
  print("Name: ${student.name}");
  print("Age: ${student.age}");
  print("Roll Number: ${student.rollNumber}");
}