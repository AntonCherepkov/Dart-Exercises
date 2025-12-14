abstract class Notification {
  late String message;
  Notification(this.message);

  void send();
  void log() => print("[LOG]: <${message}>");
}

abstract class Schedulable {
  void schedule(DateTime time);
}

class EmailNotification extends Notification implements Schedulable {
  EmailNotification(super.message);

  @override
  void send() => print("Email send: ${message}");

  @override
  void schedule(DateTime time) => print("Email sheduled at ${time.toString()}");
}

class PushNotification extends Notification {
  PushNotification(super.message);

  @override
  void send() => "Push sent: ${message}";
}