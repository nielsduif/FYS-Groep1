import processing.sound.*;

// Arrays of booleans for Keyboard handling. One boolean for each keyCode
final int KEY_LIMIT = 1024;
boolean[] keysPressed = new boolean[KEY_LIMIT];
PFont font;
Menu menu = new Menu();

void setup() {
  size(1600, 800);
  menu.start();
  font = createFont("Minecraftia-Regular.ttf", 32);
  textFont(font);
  loadSound();
}

void updateGame() {  
  if (menu.chosen) {
    levelSizer.generateUpdate();
    if (grid.doneGenerating) {
      keyHandler.createKeys();
      coinHandler.createCoin();
      powerupHandler.loadPowerups();
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
      prismStone.prismStoneUI();
      keyHandler.updateKeyUI();
      score.draw();
    }
  }
}

void draw() {
  updateGame();
  menu.display();
}


// Keyboard handling...
void keyPressed() {   
  if (key == 'q' || key == 'Q') {
    powerupHandler.powerupRadar();
    //    powerUpHandler.powerupArrow();
    powerupHandler.powerupPotion();
  }
  if (key == 'p') {
    powerupHandler.powerupPing();
  }
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
