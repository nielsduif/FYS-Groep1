Grid grid = new Grid();

void setup() {
  size(1600, 800);
  tileSet.loadTileImages();
  grid.start();
}

void draw() {
  background(100);
  
  grid.update();
}
