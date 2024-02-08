class Student {
  // Private Properties ('_variablename')
  var _firstName; 
  var _lastName;
  var _age;

  // Getter to get full name
  String get fullName => "$_firstName $_lastName";

  // Getter to read private property _age
  int get age => this._age!;

  // Setter to update private property _firstName
  set firstName(String firstName) => this._firstName = firstName;

  // Setter to update private property _lastName
  set lastName(String lastName) => this._lastName = lastName;

  // Setter to update private property _age
  set age(int age) {
    if (age < 0) {
      throw ("Age can't be less than 0");
    }
    this._age = age;
  }
}

void main() {
  Student std = new Student();
  std.firstName = "Adhithya";
  std.lastName = "Prasad";
  std.age = 20;
  // Display the values of the object
  print("Full Name: ${std.fullName}");
  print("Age: ${std.age}");
}