import 'package:issue_class_2/issue_class_2.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

void main() {
  group("Тесты класса Vector2D", () {
    double a1 = 4, y1 = 4;
    double a2 = 3, y2 = 3;
    late Vector2D resSub;
    late Vector2D resSum;
    late double resIndexOne;
    late double resIndexTwo;

    setUp(() {
      Vector2D vectorOne = Vector2D(a1, y1);
      Vector2D vectorTwo = Vector2D(a2, y2);
      resSub = vectorOne - vectorTwo;
      resSum = vectorOne + vectorTwo;
      resIndexOne = vectorOne[0];
      resIndexTwo = vectorOne[1];
    });

    test("Вычитание векторов", () {
      expect(resSub, equals(Vector2D(a1 - a2, y1 - y2)));
    });
    test("Сложение векторов", () {
      expect(resSum, equals(Vector2D(a1 + a2, y1 + y2)));
    });
    test("Значение по индексу 0", () {
      expect(resIndexOne, a1);
    });
    test("Значение по индексу 1", () {
      expect(resIndexTwo, y1);
      });
  });
}