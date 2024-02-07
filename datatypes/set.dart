//Set - all elements must be unique

void main(){
  Set mySet = {1,2,3};
  print(mySet);

  mySet.add("hello");
  mySet.remove(2);
  print(mySet);

  Set<String> newSet = Set(); //only stores string values
  newSet.addAll({"hello","hai","how r u"});
  print(newSet);

  newSet.clear(); //clears everything
  print(newSet);

  print(mySet.runtimeType);
  print(newSet.runtimeType);
}