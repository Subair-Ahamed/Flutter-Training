void main(){
  Map myMap = {
    "name" : "smily",
    "age" : 25,
  };
  print(myMap);

  myMap.addAll({ //addAll() is used to add keys and values to map.
    "role" : "fresher",
    "isEmployee" : true
  });
  print(myMap);

  print(myMap.keys);
  print(myMap.values);
  myMap.remove("isEmployee"); //to remove a pair
  print(myMap);

  Map<String, int> newMap = Map(); //only store values with string keys and int values
  print(newMap);
  newMap.addAll({
    "id":1,
    "count":20
  });
  print(newMap);

  print(myMap.runtimeType);
  print(newMap.runtimeType);
}