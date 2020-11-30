// Arrays of booleans for Keyboard handling. One boolean for each keyCode
final int KEY_LIMIT = 1024;
boolean[] keysPressed = new boolean[KEY_LIMIT];
PFont font;

void setup() {
  size(1600, 800);
  //fullScreen();
  menu.start();
  font = createFont("Minecraftia-Regular.ttf", 32);
  textFont(font);
}

void updateGame() { 
  menu.display();
  if (menu.start) {
    scroller.display();
  }
  if (menu.name) {
    levelSizer.generateUpdate();
    if (grid.doneGenerating) {
      tileSet.updateExit();
      prismStone.updatePrismStones();
      keyHandler.updateKeys();
      coinHandler.updateCoin();  
      for (int i = 0; i < pathFinding.length; i++) {
        pathFinding[i].draw();
        pathFinding[i].update();
      }
      player.update();
      player.draw();
      prismStone.prismStoneUI();
      keyHandler.updateKeyUI();
      score.draw();
    }
  }
}

void draw() {
  updateGame();
}


// Keyboard handling...
void keyPressed() {   
  if (key == 'q' || key == 'Q') {
    powerUpHandler.powerupRadar();
    //powerUpHandler.powerupArrow();
    powerUpHandler.powerupPotion();
  }
  if (key == 'p') {
    powerUpHandler.powerupPing();
  }
  if (keyCode >= KEY_LIMIT) return; //safety: if keycode exceeds limit, exit function ('return').
  keysPressed[keyCode] = true; // set its boolean to true
}

//..and with each key Released vice versa
void keyReleased() {
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = false;
}
