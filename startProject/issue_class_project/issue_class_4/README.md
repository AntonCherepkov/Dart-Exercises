## 🧩 Задача: «Система уведомлений»

### 🎯 Цель

Понять:

* разницу между `extends` и `implements`
* зачем нужен `abstract class`
* как работает полиморфизм через общий тип

---

## 📌 Условие

1. Создай **абстрактный класс** `Notification`
   Он должен:

   * иметь поле `String message`
   * иметь **абстрактный метод** `send()`
   * иметь **обычный метод** `log()`, который выводит:

     ```
     [LOG]: <message>
     ```

2. Создай **интерфейс** `Schedulable`
   (в Dart это просто `abstract class`)

   * метод `schedule(DateTime time)`

3. Реализуй классы:

### 📩 `EmailNotification`

* **extends** `Notification`
* **implements** `Schedulable`
* В `send()` выводит:

  ```
  Email sent: <message>
  ```
* В `schedule()`:

  ```
  Email scheduled at <time>
  ```

### 📱 `PushNotification`

* **extends** `Notification`
* НЕ поддерживает планирование
* В `send()`:

  ```
  Push sent: <message>
  ```

---

## 🧪 Проверка (обязательная часть)

Напиши функцию:

```dart
void processNotification(Notification notification)
```

Она должна:

1. вызвать `notification.log()`
2. вызвать `notification.send()`
3. **если объект поддерживает `Schedulable`**, вызвать `schedule()`
   (подсказка: `is`)

---

## ▶ Пример использования

```dart
void main() {
  final email = EmailNotification("Hello by email");
  final push = PushNotification("Hello by push");

  processNotification(email);
  processNotification(push);
}
```

---

## ❓ Вопросы для самопроверки (очень важные)

Ответь себе (или мне 😏):

1. Почему `processNotification` принимает **`Notification`**, а не конкретные классы?
2. Почему `PushNotification` **не обязан** реализовывать `schedule()`?
3. Что бы сломалось, если `Notification` был бы не `abstract`?
4. Почему `EmailNotification` нельзя сделать только через `implements Notification`?