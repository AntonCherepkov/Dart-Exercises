# ?? Практическое задание: *Extension Types в Dart*

## ?? Контекст задачи

Ты разрабатываешь модуль для обработки **сырого входного API-ответа**.
Данные приходят в неудобном виде (`String`, `List<dynamic>`, `Map<String, dynamic>`),
а ты хочешь работать **через типобезопасные обёртки**, не создавая тяжёлые классы.

Для этого ты используешь **extension type**.

---

## ?? ЧАСТЬ 1 — Extension type над базовым типом

### ?? Цель

Научиться расширять **базовые типы** (`String`, `int`, `List`).

### ?? Задание

1. Создай `extension type UserId(String raw)`
2. Реализуй:

   * `bool get isValid` — строка должна быть:

     * не пустой
     * содержать только цифры
     * длина ? 5
   * `int toInt()` — безопасное преобразование
   * `String get masked` — маска вида `12***45`

### ?? Ограничения

* **Нельзя** использовать обычный `extension`
* Используй именно `extension type`

---

## ?? ЧАСТЬ 2 — Extension type с Generic

### ?? Цель

Отработать **generic extension type**.

### ?? Задание

1. Создай:

```dart
extension type Box<T>(List<T> _items)
```

2. Реализуй:

* `void add(T item)`
* `T? firstOrNull`
* `Iterable<T> where(bool Function(T) predicate)`
* `Box<R> map<R>(R Function(T) mapper)`

### ?? Подсказка

Ты **не создаёшь новый список**, а управляешь поведением существующего.

---

## ?? ЧАСТЬ 3 — Extension type над пользовательским классом

### ?? Цель

Понять, как extension type **инкапсулирует модель**, не наследуясь от неё.

### ?? Дано

```dart
class UserDto {
  final String id;
  final String name;
  final List<String> roles;

  UserDto(this.id, this.name, this.roles);
}
```

### ?? Задание

1. Создай:

```dart
extension type User(UserDto dto)
```

2. Реализуй:

* `UserId get userId`
* `bool get isAdmin`
* `String get displayName` ? `"Name (id)"`

3. Добавь метод:

```dart
Map<String, dynamic> toSafeJson();
```

где:

* `id` ? замаскирован
* `roles` ? только уникальные

---

## ?? ЧАСТЬ 4 — Генератор внутри extension type (yield)

### ?? Цель

Научиться писать **генераторы (`sync*`) внутри extension type**
для **парсинга сложной структуры**.

---

### ?? Дано (сырой API-ответ)

```dart
final Map<String, dynamic> rawResponse = {
  "users": [
    {
      "id": "12345",
      "name": "Alex",
      "roles": ["admin", "user"]
    },
    {
      "id": "98765",
      "name": "Bob",
      "roles": ["user"]
    }
  ]
};
```

---

### ?? Задание

1. Создай:

```dart
extension type UserResponse(Map<String, dynamic> raw)
```

2. Реализуй генератор:

```dart
Iterable<User> parseUsers() sync*
```

3. Условия:

* Пропускать пользователей с невалидным `UserId`
* Каждый `yield` возвращает **User**, а не `UserDto`
* Обработка ошибок **без throw** (тихо пропускаем)

---

## ?? ЧАСТЬ 5 — Финальная сборка

### ?? Цель

Связать всё в одну цепочку.

### ?? Итоговый сценарий

```dart
final response = UserResponse(rawResponse);

final admins = response
    .parseUsers()
    .where((u) => u.isAdmin)
    .map((u) => u.displayName)
    .toList();
```

---

## ?? БОНУС (по желанию)

1. Добавь `extension type Role(String value)`
2. Вынеси работу с ролями в него
3. Добавь `bool get isSystemRole`

---

## ?? Что ты отработаешь

? extension type vs extension
? extension type + generic
? обёртка над моделью
? генераторы (`sync*`)
? парсинг без мутабельности
? composition вместо inheritance