class Grid {
  int cols, rows;
  int w = 20;

  void start() {
    cols = floor(width/w);
    rows = floor(height/w);

    println(cols + " x " + rows + " = " + cols * rows + " cells");

    ArrayList<Cell> grid = new ArrayList<Cell>();

    //cells
    for (int y=0; y< rows; y++) {
      for (int x=0; x < cols; x++) {
        Cell cell = new Cell(x, y, w);
        grid.add(cell);
      }
    }
  }
}
