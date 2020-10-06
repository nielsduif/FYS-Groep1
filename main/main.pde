Grid grid = new Grid();

void setup() {
  size(1920, 1080);
  grid.start();
}

void draw() {
  background(100);
  grid.update();
}
