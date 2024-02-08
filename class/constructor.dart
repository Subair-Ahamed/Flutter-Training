// syntax: class ClassName {
//   // Constructor declaration: Same as class name
//   ClassName() {
//     // body of the constructor
//   }
// }

class Employee{
  var name;
  var age;
  var id;

  Employee(name,age,id){
    this.name = name;
    this.age = age;
    this.id = id;
  }

    void display() {
    print("Name: $name");
    print("Age: $age");
    print("Employee id: $id\n"); 
  }

}

void main(){
 var emp1 = Employee("smily",23,1);
 emp1.display();

 var emp2 = Employee("adhi", 24, 2);
 emp2.display();
}

// The constructor’s name should be the same as the class name.
// Constructor doesn’t have any return type.
// Constructor is only called once at the time of the object creation.
// Constructor is called automatically when an object is created.
// Constructor is used to initialize the values of the properties of the class.