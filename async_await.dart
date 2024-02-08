//When a function is marked 'async', it signifies that it will carry out some work
//that could take some time and will return a Future object that wraps the result of that work

//The 'await' keyword allows you to delay the execution of an async function until the awaited Future has finished.

void main() {
  print("Start async await...");
  showInfo();
  print("End the process");
}

void showInfo() async {
  var info = await getInfo("Just wait");
  print(info);
}

Future<String> getInfo(String msg) { //A Future represents a single value either a data or an error asynchronously.
  final duration = Duration(seconds: 3);
  return Future.delayed(duration).then((value) => msg);
}
