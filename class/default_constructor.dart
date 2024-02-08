//automatically created by the dart compiler. A default constructor has no parameters.

class Student {
  var name;
  var age;
  var school;
  var grade;

  // Default Constructor
  Student() {
    print("Default Constructor called"); // this is for checking the constructor is called or not.
    school = "ABC School";
  }
}

void main() {
  // Here student is object of class Student.
  var student = Student();
  student.name = "John";
  student.age = 10;
  student.grade = "A";
  print("Name: ${student.name}");
  print("Age: ${student.age}");
  print("School Name: ${student.school}");
  print("Grade: ${student.grade}");
}