 void main(){
  var input = [2,5,6,7,8];

  input.forEach((var i) { //The for-each loop iterates over all elements and passes the elements to some specific function.
      print(i);
  });

      
  var color = ['green', 'black', 'yellow', 'grey']; 
  
  var value = color.map((var out) => out.toUpperCase()); 

  value.forEach(print);
 }