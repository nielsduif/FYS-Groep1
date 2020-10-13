Grid grid = new Grid();
float x, y;

void setup() {
  size(1600, 800);
  tileSet.loadTileImages();
  grid.start();
}

void draw() {
  background(100);
  
  x = mouseX;
  y = mouseY;
  x = floor(x / grid.w);
  y = floor(y / grid.w);
  
  grid.update();
}
