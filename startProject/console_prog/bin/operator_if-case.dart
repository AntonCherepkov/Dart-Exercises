/**
 * Задание по деструктурированию и if (x case ...) when ...
 * 
 * У тебя есть список пользователей:

class User {
  final String name;
  final int age;
  final String role;

  const User(this.name, this.age, this.role);
}

final users = [
  User('Anton', 34, 'admin'),
  User('Maks', 17, 'guest'),
  User('Olga', 25, 'manager'),
  User('Ilya', 15, 'guest'),
  User('Dina', 22, 'admin'),
];

Вывести такие категории:
* Взрослый админ — если возраст >= 18 и роль == 'admin'
* Совершеннолетний пользователь — если возраст >= 18
* Несовершеннолетний пользователь — если возраст < 18
* Особый гость — если роль == 'guest' И возраст > 16
(тут специально добавлено when)
* Остальные пользователи — во всех других случаях

В конце вывести статистику:
сколько нашлось:
* взрослых админов
* совершеннолетних
* несовершеннолетних
* особых гостей
* остальных
*/

class User {
  final String name;
  final int age;
  final String role;

  User(this.name, this.age, this.role);
}

void main(List<String> parameters) {
  int admins = 0, adults = 0, minors = 0, specialGuests = 0, other = 0;

  List<User> users = [
    User('Anton', 34, 'admin'),
    User('Maks', 17, 'guest'),
    User('Olga', 25, 'manager'),
    User('Ilya', 15, 'guest'),
    User('Dina', 22, 'admin'),
  ];

  for (var user in users) {
    // Взрослые админы:
    if (user case User(:var name, :var age, :var role) when role == 'admin' && age >= 18) {
      print('Найден взрослый админ: $name');
      admins++;
    }
    // Прочие взрослые:
    else if (user case User(:var name, :var age, :var role) when age >= 18) {
      print('Найден взрослый пользователь: $name ($role)');
      adults++;
    }
    else if (user case User(:var name, :var age, :var role) when age >= 16 && role == 'guest') {
      print('Найден особый гость: $name');
      specialGuests++;
    }
    // Несовершеннолетние:
    else if (user case User(:var name, :var age, :var role) when age < 18) {
      print('Найден несовершеннолетний пользователь: $name ($role)');
      minors++;
    }
    else {
      print('Это пользователь вне категорий: ${user.name}');
    }
  }
}

