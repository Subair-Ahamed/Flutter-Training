void main(){
  String str1 = 'String datatype';
  String str2 = " with Dart language";
  String str3 = str1 + str2;
  print("the concatenation is $str3");

  print(str1.length);
  print(str1.toUpperCase());
  print(str2.toLowerCase());
  print(str3.substring(7,20));
  print(str3.runtimeType);
}