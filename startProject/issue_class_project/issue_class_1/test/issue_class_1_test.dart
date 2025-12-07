
import 'package:test/test.dart';
import 'package:issue_class_1/issue_class_1.dart';

void main() {
  group('Проверка класса User', () {
    late User testUser;
    setUp(() {
      testUser = User("Tester", 152);
    });
    test('Проверка парольной политики', () {
      String inputPassword = 'asdkfajokshf';
      testUser.password = inputPassword;
      expect(testUser.password, equals("*" * inputPassword.length));
    });
  });

  group('Проверка класса City', () {
    late City testCityFirst;
    late City testCitySecond;
    setUp(() {
      testCityFirst = City('TestTown', 10_000);
      testCitySecond = City('TestVillege', 1000);
    });
    test('Проверка добавления города', () {
      // Слишком небольшой класс, нет объекта для проверки
    });
    test('Проверка синглтона города', () {
      // Слишком небольшой класс, нет объекта для проверки
    });
  });
}
