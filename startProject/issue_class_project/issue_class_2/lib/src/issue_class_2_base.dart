import 'dart:io';

/** Задание 1 - Класс Vector2D 
 * Переопределены операторы +-*[][]= ==
*/

class Vector2D {
  late double x;
  late double y;

  static int createdVerctors = 0;
  static void showStates() {
    stdout.write('Создано векторов: $createdVerctors');
  }

  Vector2D(this.x, this.y) {
    createdVerctors++;
  }
  
  Vector2D operator+(Vector2D other) {
    return Vector2D(this.x + other.x, this.y + other.y);
  }
  
  Vector2D operator-(Vector2D other) {
    return Vector2D(this.x - other.x, this.y - other.y);
  }

  Vector2D operator*(int k) {
    return Vector2D(this.x * k, this.y * k);
  }

  double operator[](int index) {
    if (index == 0) {
      return x;
    } else if (index == 1) {
      return y;
    } else {
      throw RangeError("Index beyond the range");
    }
  }

  void operator[]=(int index, double data) {
    if (index == 0) {
      x = data;
    } else if (index == 1) {
      y = data;
    } else {
      throw RangeError("Index beyond the range");
    }
  }

  /** При переопределении надо делать проверки в следующем порядке:
   * 1. Идентичность 
   * 2. или все следующие: внешний объект is экземпляр
   * 3. тип runtimeType экземпляра и внешнего объекта (от сравнения с наследниками)
   * 4. все остальные поля
   */
  @override
  bool operator==(Object other) {
    return identical(this, other) || 
      other is Vector2D && 
      runtimeType == other.runtimeType && 
      x == other.x && y == other.y;
  }

  /**Переопределяем hashCode через Object.hashAll(List<T>) или Object.hash(<T>) */
  @override
  int get hashCode => Object.hashAll([x, y]);

  @override
  String toString() => "Vector(${x.toStringAsFixed(1)}, ${y.toStringAsFixed(1)})";
}