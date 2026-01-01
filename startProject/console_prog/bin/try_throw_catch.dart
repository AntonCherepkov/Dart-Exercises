abstract class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}

class EmptyCredentialsException extends AuthException {
  EmptyCredentialsException([message = 'Не указаны полномочия'])
    :super(message);

  @override
  String toString() => message;
}

class InvalidPasswordException extends AuthException {
  InvalidPasswordException([message = 'Некорректный пароль'])
    :super(message);

  @override
  String toString() => message;
}

class UserNotFoundException extends AuthException {
  UserNotFoundException([message = 'Не найден пользователь'])
    :super(message);

  @override
  String toString() => message;
}

class UserService {
  final _users = <String, String>{
    'admin': '1234',
    'user': 'qwerty',
  };

  void login(String? username, String? password) {
    if (username == null || password == null) {
      throw EmptyCredentialsException();
    } else if (!_users.containsKey(username)) {
      throw UserNotFoundException();
    }

    var validPassword = _users[username];
    if (validPassword == null || validPassword != password) {
      throw InvalidPasswordException();
    }
  }
}

void main(List<String?> arguments) {
  final service = UserService();
  try {
    service.login('admin', '123');
  } on AuthException catch (e) {
    print('Auth error: ${e.message}');
  } catch (e) {
    print('Unknown error: $e');
  } finally {
    print('Auth attempt finished');
  }
}
