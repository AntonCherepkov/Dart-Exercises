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

extension type Box<T>(List<T> _items) {
  
  void add (T elem) => _items.add(elem);
  
  T? firstOrNull() => _items.isEmpty ? null : _items[0];
  
  Iterable<T> where(bool Function(T) predicate) {
    return List.from(_items.where(predicate));
  }

  Box<R> map<R>(R Function(T) mapper) {
    return Box(
            List.from(
              _items.map(
                (e) => mapper(e))));
  }
}

class UserDto {
  final String id;
  final String name;
  final List<String> roles;

  UserDto(this.id, this.name, this.roles);
}

extension type User(UserDto dto) {
  // TODO: реализовать
}

extension type UserResponse(Map<String, dynamic> raw) {
  Iterable<User> parseUsers() sync* {
    // TODO: реализовать
  }
}