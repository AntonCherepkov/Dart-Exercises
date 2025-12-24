extension type NameString(String value) {
  bool get isDigit => RegExp(r'^\d+$').hasMatch(value); 
  bool get isValid => value.isNotEmpty && this.isDigit && value.length >= 5;
  String get masked => value.replaceRange(
    (value.length ~/ 2) - (value.length ~/ 2 ~/ 2), 
    (value.length ~/ 2) + (value.length ~/ 2 ~/ 2), '*');
  int toInt() {
    int? parseValue = int.tryParse(value);
    if (parseValue != null) {
      return parseValue;
    } else {
      throw TypeError();
    }
  }
}