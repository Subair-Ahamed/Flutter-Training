class Animal {
  var name;
  var age;
  var breed;

  // Default Constructor
  Animal() {
    print("This is a default constructor");
  }

  // Named Constructor
  Animal.namedConstructor1(name, age) {
    this.name = name;
    this.age = age;
  }

  // Named Constructor
  Animal.namedConstructor2(name, breed) {
    this.name = name;
    this.breed = breed;
  }
}
void main(){
  // Here animal is object of class Animal.
  var animal = Animal.namedConstructor1("Cat", 5);
  print("Name: ${animal.name}");
  print("Age: ${animal.age}");

  Animal animal2 = Animal.namedConstructor2("Dog","Rottweiler");
  print("Name: ${animal2.name}");
  print("Breed: ${animal2.breed}");
}