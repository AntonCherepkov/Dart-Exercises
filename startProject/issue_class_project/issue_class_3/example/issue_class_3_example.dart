import 'package:issue_class_3/issue_class_3.dart';

void main() {

  List<Map<String, dynamic>> listMaps = [
    {"type": 'light'},
    {"type": 'hard'},
    {"type": 'bugaga'},
    {"no_type": "bugaga"}
  ];

  for (var json in listMaps) {
    for (var MapEntry(:key, :value) in json.entries) {
      if (key == "type") {
        switch(value) {
          case ('light') :
            print("this is light");
            break;
          case('hard') :
            print("this is hard");
            break;
          case _ :
            print("i don't know arguments");
        }
      } else {
        throw ArgumentError("invalid key");
      }
    }
  }
}
