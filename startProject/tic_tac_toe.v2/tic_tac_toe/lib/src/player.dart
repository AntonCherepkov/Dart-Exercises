part of 'game.dart';

class Player {
  CellType cellType;

  Player(this.cellType);

  void nextPlayer() {
    cellType = cellType == CellType.cross ? CellType.nought : CellType.cross;
  }

  String get symbol => cellType == CellType.cross ? 'X' : '0';
}
