class Cell {
  int tileID;
  
  int x, y, w;
  boolean[] walls = {true, true, true, true};
  boolean visited = false;
  boolean isDrawn;

  Cell(int _x, int _y, int _w) {
    x = _x;
    y = _y;
    w = _w;
  }

  Cell checkNeighbors() {
    ArrayList<Cell> neighbors = new ArrayList<Cell>();

    Cell top    = grid.grid.get(grid.index(x, y-1));
    Cell right  = grid.grid.get(grid.index(x+1, y));
    Cell bottom = grid.grid.get(grid.index(x, y+1));
    Cell left   = grid.grid.get(grid.index(x-1, y));

    if (top != null && !top.visited) {
      neighbors.add(top);
    }
    if (right != null && !right.visited) {
      neighbors.add(right);
    }
    if (bottom != null && !bottom.visited) {
      neighbors.add(bottom);
    }
    if (left != null && !left.visited) {
      neighbors.add(left);
    }

    if (neighbors.size() > 0) {
      int r = floor(random(0, neighbors.size()));
      return neighbors.get(r);
    } else {
      return null;
    }
  }

  void highlight() {
    noStroke();
    fill(255, 100, 255);
    rect(x * w, y * w, w, w);
  }

  void show() {
    int xL = x * w;
    int yL = y * w;
    stroke(255);
    if (walls[0]) {    
      line(xL, yL, xL + w, yL);         //top
    }
    if (walls[1]) {    
      line(xL + w, yL, xL + w, yL + w); //right
    }
    if (walls[2]) {    
      line(xL, yL + w, xL + w, yL +w);  //bottom
    }
    if (walls[3]) {    
      line(xL, yL, xL, yL + w);         //left
    }

    if (visited) {
      noStroke();
      fill(0, 0, 0, 50);
      rect(xL, yL, w, w);
    }
  }
}
