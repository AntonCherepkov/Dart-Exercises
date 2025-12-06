import 'dart:io';
import 'dart:math';

typedef StatusMap = Map<int, String>;
typedef ImageMap = Map<int, String>;
typedef Board = List<List<int>>;

StatusMap mapStatusGame= {
  0: 'Игра продолжается',
  1: 'Победа крестиков',
  2: 'Победа ноликов',
  3: 'Ничья'
};

ImageMap mapImageFigure = {
  0: '.',
  1: 'X',
  2: '0'
};

// эквивалент фигурок
const int empty = 0;
const int cross = 1;
const int zero = 2;

// статусы игры
const int gameContinue = 0;       // Продолжение игры
const int winCross = 1;           // Крестики выиграли
const int winZero = 2;            // Нолики выиграли
const int draw = 3;               // Ничья

const int defaultSezeBoard = 3;   // Дефолтный размер поля
late int inputSezeBoard;          // Заданный пользователем размер
late Board board;                 // Главный объект поля

// рандомный выбор игрока
int randomChoise() {
  final random = Random();
  List<int> itemsPlayer = [cross, zero];
  return itemsPlayer[random.nextInt(itemsPlayer.length)];
}
int currentPlayer = randomChoise();
int currentStatus = gameContinue;

/** 
 * Функция для инициализации поля
*/
List<List<int>> initBoard() {
  while(true) {
    stdout.write('Введите размерность поля: '); 
    String? strInputSize = stdin.readLineSync();
    if (strInputSize == null) {
      stdout.write('Необходимо ввести значение!');
      continue;
    } else if (strInputSize != null) {
      int? intInputSize = int.tryParse(strInputSize);
      if (intInputSize != null && 3 > intInputSize && intInputSize > 9) {
        stdout.write('Значение должно быть не менее 3 и не более 5');
        continue;
      } else {
        inputSezeBoard = intInputSize!;
        break;
      }
    }
  }
  return List.generate(inputSezeBoard, (_) => List.filled(inputSezeBoard, empty));
}

/**
 * Функция для вывода доски с реальной расстановкой фигур
*/
void outputBoard() {
  stdout.write("  ");
  for (int i = 1; i < inputSezeBoard + 1; i++) {
    stdout.write('${i} ');
  }
  stdout.write('\n');
  int countLine = 1;
  for (var line in board) {
    stdout.write('${countLine} ');
    for (var cow in line) {
      stdout.write("${mapImageFigure[cow]} ");
    }
    stdout.write('\n');
    countLine++;
  }  
}

/**
 * Проверка поля для установки
 */
bool isEmptyCage(int x, int y) => board[x][y] == empty;

/**
 * Функция для проверок всех выигрышных комбинаций:
 */
void winEvent() {
  bool winFound = false;
  for (int i = 0; i < inputSezeBoard; i++) {
    // проверка строк и столбцов
    if (board.every((line) => line[i] == currentPlayer)) {
      winFound = true;
      break;
    }
    if (board[i].every((row) => row == currentPlayer)) {
      winFound = true;
      break;
    }
    // проверка по главной диагонали
    if (!winFound) {
      if (List.generate(inputSezeBoard, (i) => board[i][i]).every(
          (pos) => pos == currentPlayer
      )) {
        winFound = true;
        break;
      }
    }
    // проверка по обратной диагонали
    if (!winFound) {
      if (List.generate(inputSezeBoard, (i) => board[i][inputSezeBoard - i -1]).every(
          (pos) => pos == currentPlayer
      )) {
        winFound = true;
        break;
      }
    }
  }
  // провераяем есть ли победитель, или есть ли возможность продолжения игры
  if (winFound) {
    currentStatus = currentPlayer == cross ? winCross : winZero;
  } else if (board.every((line) => line.every((cell) => cell != empty))) {
    currentStatus = draw;
  } else {
    currentPlayer = currentPlayer == cross ? zero : cross;
  }
}

/**
 * Функция для установки значения на игровом поле
 */
void makeMove() {
  StringBuffer buffer = StringBuffer();
  buffer.write('Ходит игрок: ${mapImageFigure[currentPlayer]}! ');

  bool validInput = true;
  while (validInput){
    buffer.write('Введите номер поля -> [X Y]: ');
    stdout.write(buffer.toString());
    String? strInputCage = stdin.readLineSync();
    if (strInputCage == null || strInputCage == '') {
      stdout.write('Необходимо ввести координаты!');
      continue;
    } else if (strInputCage == 'q') {
      print('Выход из программы');
      currentStatus = draw;
      return;
    }
    final [x_, y_, ...] = strInputCage.split(' '); 
    int? x = int.tryParse(x_);
    int? y = int.tryParse(y_);

    if (x == null || y == null) {
      print('Неудачная попытка ввода!');
      stdout.write(buffer.toString());
      continue;
    }
    print('x: $x'); print('y: $y');      
    if (x < 1 || x > inputSezeBoard || y < 1 || y > inputSezeBoard ) {
      print('Введенные числа выходят за рамки индекса');
      stdout.write(buffer.toString());
      continue;
    }
    x--; y--;

    if (isEmptyCage(x, y)) {
      board[x][y] = currentPlayer;
      validInput = false;
      break;
    }
  }
}

void resetVar() {
  currentPlayer = randomChoise();
  currentStatus = gameContinue;
}

void playProccess() {
  board = initBoard();
  outputBoard();    
  print('Игра началась!');
  while (currentStatus == gameContinue) {
    makeMove();
    outputBoard();
    winEvent();
  }
  print('Результат игры: ${mapStatusGame[currentStatus]}');
  stdout.write('Хотите сыграем еще раз? [Y/N]: ');
  String? restartCommand = stdin.readLineSync();
  if (restartCommand != null) {
    if (restartCommand.toUpperCase() == "Y") {
      resetVar();
      playProccess();
    }
  }
}