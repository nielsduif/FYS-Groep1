// Arrays of booleans for Keyboard handling. One boolean for each keyCode
final int KEY_LIMIT = 1024;
boolean[] keysPressed = new boolean[KEY_LIMIT];
PFont font;

void setup() {
  size(1600, 800);
  tileSet.loadTileImages();
  grid.start();
  pathFinding.start();
  font = createFont("Minecraftia-Regular.ttf", 32);
  textFont(font);
}

void updateGame() {  
  grid.update();
  if (grid.doneGenerating) {
    pathFinding.draw();
    tileSet.updateExit();
    pathFinding.update();
    player.update();
    prismStone.updatePrismStones();
    player.draw();
    prismStone.prismStoneUI();
  }
}

void drawGame() {
  background(255);
}

void draw() {
  updateGame();
  //drawGame();
}

// Keyboard handling...
void keyPressed() {  
  if (keyCode >= KEY_LIMIT) return; //safety: if keycode exceeds limit, exit function ('return').
  keysPressed[keyCode] = true; // set its boolean to true
}

//..and with each key Released vice versa
void keyReleased() {
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = false;
}
