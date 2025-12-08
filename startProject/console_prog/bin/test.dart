void main(List<String> parameters) {
  Map myMap = Map();
  print(myMap.keys);
  myMap.addAll({'first': 1, 'second': 2});
  print(myMap);
  print(myMap.keys.toList());
  myMap.putIfAbsent('thried', () => 3);
  print(myMap);
  var entries = myMap.entries;
  entries.forEach((e) => print(e));

double a = 4.2;
print(a.toStringAsFixed(2));
print(a.toStringAsExponential(2));
}