import 'dart:io';

void main(List<String> parameters) {
  print('Please, input number: ');
  String? inputUser = stdin.readLineSync();
  var data = int.tryParse(inputUser!);

  print('You are write: ${data}');
  print('Type data: ${data.runtimeType}');

  print('Please, input list numbers:');
  String? inputListUser = stdin.readLineSync();
  
  if (inputListUser == null || inputListUser.isEmpty) {
    print('Data not faund');
    return;

  } else {

    List<String> newDataString = inputListUser!.split(' ');
    List<int> newDataInt = newDataString.map(int.parse).toList();
    print('We are iterable numbers: ${newDataInt}');
  }
}