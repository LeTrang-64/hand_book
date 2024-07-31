void main(){
  var record = ('first', a: 2, b: true, 'last');

  print(record.$0); // Prints 'first'
  print(record.a); // Prints 2
  print(record.b); // Prints true
  print(record.$1); // Prints 'last'
}