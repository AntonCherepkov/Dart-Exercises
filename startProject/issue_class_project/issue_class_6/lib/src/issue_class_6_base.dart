// Расширение над простой строкой, вмлидация и пару методов -------------------
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

// generic-расширение над списком типовых данных ------------------------------
extension type Box<T>(List<T> _items) {
  
  void add (T elem) => _items.add(elem);
  
  T? firstOrNull() => _items.isEmpty ? null : _items[0];
  
  // Вернет список, значения которого совпадут с условиями в perdicate - (callable) 
  Iterable<T> where(bool Function(T) predicate) {
    return List.from(_items.where(predicate));
  }

  // Произвудет map действия с каждым элементом внутри расширяемого действия
  Box<R> map<R>(R Function(T) mapper) {
    return Box(
            List.from(
              _items.map(
                (e) => mapper(e))));
  }
}

// Пользовательский класс -----------------------------------------------------
class UserDto {
  late final String id;
  final String name;
  final List<String> roles;

  UserDto(this.id, this.name, this.roles);
}

// Расширение над Id пользователя, добавим валидацию --------------------------
extension type UserId(String id) {
  bool validId() {
    String pattern = r'^[A-Z0-9]{5}$';
    RegExp regexp = RegExp(pattern);
    return regexp.hasMatch(id);
  }
}

// Расшерение над пользовательским классом с информацией о пользователе -------
extension type User(UserDto dto) {
  UserId get userId => UserId(dto.id);
  bool get isAdmin => dto.roles.contains('admin');
  String get displayName => "Name ${dto.id}";
}

extension type UserResponse(Map<String, dynamic> raw) {
  Iterable<User> parseUsers() sync* {
    // TODO: реализовать
   }
}