// Arrays of booleans for Keyboard handling. One boolean for each keyCode
final int KEY_LIMIT = 1024;
boolean[] keysPressed = new boolean[KEY_LIMIT];
PFont font;
Menu menu = new Menu();

void setup() {
  size(1600, 800);
  menu.start();
  imageLoader.loadTileImages();
  grid.start();
  pathFinding.start();
  font = createFont("Minecraftia-Regular.ttf", 32);
  textFont(font);
}

void updateGame() {  
  grid.update();
  if (grid.doneGenerating) {
    keyHandler.createKeys();
    coinHandler.createCoin();
    tileSet.updateExit();
    prismStone.updatePrismStones();
    coinHandler.updateCoin();
    keyHandler.updateKeys();
    pathFinding.draw();
    pathFinding.update();
    player.update();
    player.draw();
    prismStone.prismStoneUI();
    score.draw();
  }
}

void drawGame() {
  background(255);
}

void draw() {
  updateGame();
  //drawGame();
  menu.display();
}


// Keyboard handling...
void keyPressed() {  
  if (keyCode >= KEY_LIMIT) return; //safety: if keycode exceeds limit, exit function ('return').
  keysPressed[keyCode] = true; // set its boolean to true
  if (keyCode == DOWN) {
    if (menu.selected + 1 < menu.tabAmount) {
      menu.selected++;
    }
  }
  if (keyCode == UP) {
    if (menu.selected - 1 >= 0) {
      menu.selected--;
    }
  }
}

//..and with each key Released vice versa
void keyReleased() {
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = false;
}
