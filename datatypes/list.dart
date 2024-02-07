void main() 
{ 
  List l1 = [1,2,"string",true];
  print(l1);
  print(l1[2]); //prints the value at specified index
  l1[2] = "hello"; //change the value

  List l2 = [];
  l2.add(55);
  l2.add(false);
  l2.add("thanks");
  print(l2);
  l2.remove(55); //to emove value
  l2.add(29);
  print(l2);

  List<int> l3 = [1,2,3,4]; //only store integer in this list
  print(l1.runtimeType);
  print(l3.runtimeType);
}
  