class User {
  final String name;
  final int age;

  const User(this.name, this.age);
}

void main(List<String> parameters) {
  var usreData = ['Anton', 32, 'NetherLands'];
  var [nameL, ageL, country] = usreData;

  /* Если данные однородны, то можно использовать ... */
  var userNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  final [num1, ...] = userNumbers;
  final [..., num2, num3] = userNumbers;

  print('Деструктурированный список: ${nameL}, ${ageL}, ${country}');
  print('Деструктурированный список: ${num1}');
  print('Деструктурированный список: ${num2}, ${num3}');

  var mapSystemSettings = {
    'theme': 'dark',
    'volueme': 70,
    'notification': true
  };
  var {'theme': theme, 'volueme': volueme, 'notification': notification} = mapSystemSettings;
  print('Деструктурированный мап: $theme, $volueme, $notification');

  var user = User('AntonCh', 34);
  var User(:name, :age) = user;
  var User(name: nameC, age: ageC) = user;
  print('Деструктурирование класса: $name, $age');
  print('Деструктуризация класса: ${nameC}, ${ageC}');

  Map<String, dynamic> parseMap = {
    "person_1": {
      "name": "Dmitry",
      "age": 32
    },
    "person_2": {
      "name": "Anatoly",
      "age": 33
    },
    "cities": ["Ekatirinburg", "Moskow"],
  };

  var {"person_1": {"name": name_1, "age": age_1}} = parseMap;
  var {"person_2": {"name": name_2, "age" : age_2 }} = parseMap;
  print("Деструктурированная мапка: $name_1, $age_1");
  print("Деструктурированная мапка: $name_2, $age_2");
}