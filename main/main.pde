import processing.sound.*;

// Arrays of booleans for Keyboard handling. One boolean for each keyCode
final int KEY_LIMIT = 1024;
boolean[] keysPressed = new boolean[KEY_LIMIT];
PFont font;

void setup() {
  size(1600, 800);
  //fullScreen();
  noCursor();
  menu.start();
  font = createFont("Minecraftia-Regular.ttf", 32);
  textFont(font);
  loadSound();
}

void updateGame() { 
  menu.display();
  if (menu.start && !menu.name) {
    scroller.display();
  }
  if (menu.name) {
    levelSizer.generateUpdate();
    if (grid.doneGenerating) {
      tileSet.updateExit();
      prismStone.updatePrismStones();
      keyHandler.updateKeys();
      coinHandler.updateCoin();  
      powerupHandler.updatePowerup();
      for (int i = 0; i < pathFinding.length; i++) {
        pathFinding[i].draw();
        pathFinding[i].update();
      }
      player.update();
      player.draw();
      powerupHandler.powerupUI();
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
    powerupHandler.powerupPing();
  }
  if (key == 'p') {
    powerupHandler.powerupWhistle();
  }
  if (key == 'l') {
    powerupHandler.powerupArrow();
  }
  if (keyCode >= KEY_LIMIT) return; //safety: if keycode exceeds limit, exit function ('return').
  keysPressed[keyCode] = true; // set its boolean to true
}

//..and with each key Released vice versa
void keyReleased() {
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = false;
}
