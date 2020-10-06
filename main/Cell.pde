class Cell {
  Cell(int x, int y, int w) {
    line(x * w, y * w, x * w + w, y * w);          //top
    line(x * w + w, y * w, x * w + w, y * w + w);  //rside
    line(x * w, y * w, x * w, y * w + w);          //lside
    line(x * w, y * w + w, x * w + w, y * w + w);  //bot
  }
}
