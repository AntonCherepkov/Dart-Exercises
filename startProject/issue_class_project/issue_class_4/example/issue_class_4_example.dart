import 'package:issue_class_4/issue_class_4.dart';

void messageSender(Notification notify) {
  notify.log();
  notify.send();
  if (notify is Schedulable) {
    (notify as Schedulable).schedule(DateTime.utc(2025, 15, 12));
  }
}


void main() {
  EmailNotification email = EmailNotification("Hello by Email");
  PushNotification push = PushNotification("Hello by push");

  messageSender(email);
  messageSender(push);
}
