//Anonymous or closure funtion does not have a name but only arguments

void main(){
  (name){
    print("Anonymous : "+ name);
  }("Adhithya");

  var list = ["hi",5,true];
  list.forEach((var i) { //this is also anonymous
    print("The value is $i");
    });
}