class Person {
  final String name;
  final int age;

  // Private constructor
  Person._(this.name, this.age);

  // Static named constructor
  static Person createPerson(String name, int age) {
    return Person._(name, age);
  }

  void display() {
    print("Name : $name, Age : $age");
  }
}

void main() {
  // Using the static constructor
  var person1 = Person.createPerson('John', 30);
  var person2 = Person.createPerson("Adhi", 25);
  person1.display();
  person2.display();
  // print('Name: ${person.name}, Age: ${person.age}');
}
