enum val {
  Welcome, to, Dart
}
 
void main() {
  for (var geek in val.values) {
    print(geek);
  }

    var geek = val.Dart;
  // Switch-case
    switch (geek) {
      case val.Welcome: 
        print("This is not the correct case."); 
        break;
      case val.to: 
        print("This is not the correct case."); 
        break;
      case val.Dart: 
        print("This is the correct case."); 
        break;
    }
}


