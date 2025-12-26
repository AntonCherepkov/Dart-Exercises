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

  @override
  String toString() => 'name: $name\nid: $id\nroles: ${roles.join(", ")}';
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

// Расширение с генератором внутри для формирование User объектов из списка ---
extension type UserResponse(Map<String, dynamic> raw) {
  Iterable<User> parseUsers() sync* {
    final users = raw['users'];
    if (users is! List) {
      throw TypeError();
    }
    for (var user in users) {
      if (user is! Map<String, dynamic>) {
        continue;
      }
      final id = user['id'];
      final name = user['name'];
      final roles = user['roles'];

      if (id is! String || name is! String || roles is! List) {
        continue;
      }

      final stringRoles = roles.whereType<String>().toList();

      final userId = UserId(id);
      if (!userId.validId()) continue;

      yield User(UserDto(id, name, stringRoles));
    }
  }
}