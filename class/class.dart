class Person{ //naming of class name should be capitalized.
  var name;
  var age;
  var isEmployed;

  void display(){ //function inside class
    print("$name with age: $age is employed: $isEmployed");
  }
}

void main(){
  var person = Person(); //creating instance of class
  person.name = "Adhithya";
  person.age = 24;
  person.isEmployed =true;

  person.display(); //accessing class function
}