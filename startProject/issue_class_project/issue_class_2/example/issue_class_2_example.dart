import 'package:issue_class_2/issue_class_2.dart';

void main() {
  Vector2D vector_1 = Vector2D(2, 4);
  Vector2D vector_2 = Vector2D(4, -2);
  Vector2D vector_3 = vector_1 + vector_2;
  print("result: ${vector_3.toString()}");
  Vector2D vector_4 = vector_1 - vector_2;
  print("result: ${vector_4.toString()}");
  print("index 0: ${vector_1[0]}");
  print("index 1: ${vector_1[1]}");
  vector_1[0] = 3;
  print("result chenges in vector 1 by index: ${vector_1.toString()}");
}