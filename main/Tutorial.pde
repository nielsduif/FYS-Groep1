
Tutorial tutorial = new Tutorial();
class Tutorial {
  PImage tutorialPlayerImage, tutorialMonsterImage, tutorialMonsterImage2, 
    tutorialPowerup1, tutorialPowerup2, tutorialPowerup3, tutorialPowerup4, tutorialPowerup5, 
    tutorialCoin, tutorialKey, tutorialPrismstone, tutorialExitClosed, tutorialExitOpen;
  float playerX, playerY, playerW, playerH;
  float monsterX, monsterY, monsterW, monsterH;
  float keyW, exitW;
  float tutorial34X, tutorial34Y, tutorial34Spacing, tutorial34W;
  float textRightX, textRightY, textLeftX, textLeftY, textUpX, textUpY, textDownX, textDownY;
  float textMonster1X, textMonster1Y, textMonster2X, textMonster2Y, textMonster3X, textMonster3Y;
  float textTutorial34X, textTutorial34X2;
  float textContinueX, textContinueY, textGobackX, textGobackY, textExitX, textExitY;
  int powerupAmount = 5;
  boolean tutorial1, tutorial2, tutorial3, tutorial4;
  boolean keyPressedOnce;
  void setup() {
    tutorialPlayerImage = loadImage("player.png");
    tutorialMonsterImage = loadImage("monster.png");
    tutorialMonsterImage2 = loadImage("monsterMad.png");
    tutorialPowerup1 = loadImage("ping.png"); 
    tutorialPowerup2 = loadImage("vision.png");
    tutorialPowerup3 = loadImage("whistle.png"); 
    tutorialPowerup4 = loadImage("potion.png");
    tutorialPowerup5 = loadImage("xray.png");
    tutorialCoin = loadImage("Coin.png");
    tutorialKey = loadImage("Key.png");
    tutorialPrismstone = loadImage("PrismStone.png");
    tutorialExitClosed = loadImage("Tile15.png");
    tutorialExitOpen = loadImage("Tile16.png");
    playerX = width/2;
    playerY = height/2 - playerH;
    playerW = width/10;
    playerH = playerW * 2;
    monsterX = width/2;
    monsterY = height/2;
    monsterW = width/10;
    monsterH = playerW *2;
    tutorial34X = width/6;
    tutorial34Y = height/7 + tutorial34W;
    tutorial34Spacing = height/7;
    tutorial34W = height/8;
    keyW = tutorial34W/2;
    exitW = tutorial34W * 3;
    textRightX = playerX + playerW;
    textRightY = playerY;
    textLeftX = playerX - playerW;
    textLeftY = playerY;
    textUpX = playerX;
    textUpY = playerY - playerH/2;
    textDownX = playerX;
    textDownY = playerY + playerH/2;
    textMonster1X = monsterX;
    textMonster1Y = monsterY - monsterH;
    textMonster2X = monsterX;
    textMonster2Y = textMonster1Y;
    textMonster3X = monsterX;
    textMonster3Y = monsterY + monsterH/2;
    textTutorial34X = width/2;
    textTutorial34X2 = tutorial34X + tutorial34W;
    textContinueX = width;
    textContinueY = height;
    textGobackX = 0;
    textGobackY = height;
    textExitX = width * .5;
    textExitY = height;
  }

  void display() {
    if (!keysPressed['X'] && !keysPressed['S']) {
      keyPressedOnce = false;
    }
    if (tutorial2) {
      tutorial1 = false;
      tutorial3 = false;
      tutorial4 = false;
      if (keyPressedOnce == false) {
        if (keysPressed['X']) {
          tutorial2 = false;
          tutorial3 = true;
          keyPressedOnce = true;
        }
        if (keysPressed['S']) {
          tutorial1 = true;
          tutorial2 = false;
          keyPressedOnce = true;
        }
      }
    } else if (tutorial3) {
      tutorial1 = false;
      tutorial2 = false;
      tutorial4 = false;
      if (keyPressedOnce == false) {
        if (keysPressed['X']) {
          tutorial3 = false;
          tutorial4 = true;
          keyPressedOnce = true;
        }
        if (keysPressed['S']) {
          tutorial2 = true;
          tutorial3 = false;
          keyPressedOnce = true;
        }
      }
    } else if (tutorial4) {
      tutorial1 = false; 
      tutorial2 = false; 
      tutorial3 = false;
      if (keyPressedOnce == false) {
        if (keysPressed['X']) {
          menu.tutorialShow = false;
          keyPressedOnce = true;
        }
        if (keysPressed['S']) {
          tutorial3 = true;
          tutorial4 = false;
          keyPressedOnce = true;
        }
      }
    } else { 
      tutorial1 = true;
    }
    if (tutorial1) {
      tutorial2 = false;
      tutorial3 = false;
      tutorial4 = false;
      background(0);
      image(tutorialPlayerImage, playerX, playerY, playerW, playerH);
      imageMode(CENTER);

      textSize(25);
      fill(255);
      textAlign(LEFT, CENTER);
      text("Press → to move right", textRightX, textRightY);
      textAlign(RIGHT, CENTER);
      text("Press ← to move left", textLeftX, textLeftY);
      textAlign(CENTER, BOTTOM);
      text("Press ↑ to move up", textUpX, textUpY);
      textAlign(CENTER, TOP);
      text("Press ↓ to move down", textDownX, textDownY);
      
      textAlign(RIGHT, BOTTOM);
      text("Press X to continue", textContinueX, textContinueY);
      textAlign(CENTER, BOTTOM);
      text("Press Z to exit", textExitX, textExitY);

      if (keyPressedOnce == false) {
        if (keysPressed['Z']) {
          menu.tutorialShow = false;
          keyPressedOnce = true;
        }
        if (keysPressed['X']) {
          tutorial1 = false;
          tutorial2 = true;
          keyPressedOnce = true;
        }
      }
    }

    if (tutorial2) {
      background(0);
      image(tutorialMonsterImage, monsterX, monsterY, monsterW, monsterH);
      imageMode(CENTER);

      textSize(40);
      fill(255, 0, 0);
      textAlign(CENTER, BOTTOM);
      text("This is the enemy!", textMonster1X, textMonster1Y);
      textAlign(CENTER, TOP);
      text("The enemy will chase you and kill you immediately!", textMonster2X, textMonster2Y);
      textSize(25);
      fill(255);
      textAlign(CENTER, TOP);
      text("Press A to preview how the enemy looks while chasing you", textMonster3X, textMonster3Y);
      textAlign(RIGHT, BOTTOM);

      text("Press X to continue", textContinueX, textContinueY);
      textAlign(LEFT, BOTTOM);
      text("Press S to go back", textGobackX, textGobackY);
      textAlign(CENTER, BOTTOM);
      text("Press Z to exit", textExitX, textExitY);

      if (keyPressedOnce == false) {
        if (keysPressed['A']) {
          image(tutorialMonsterImage2, monsterX, monsterY, monsterW, monsterH);
          imageMode(CENTER);
          keyPressedOnce = true;
        }
        if (keysPressed['Z']) {
          menu.tutorialShow = false;
          keyPressedOnce = true;
        }
      }
    }

    if (tutorial3) {
      background(0);
      imageMode(CENTER);
      image(tutorialCoin, tutorial34X, tutorial34Y + tutorial34Spacing, tutorial34W, tutorial34W);
      image(tutorialKey, tutorial34X, tutorial34Y + tutorial34Spacing * 2, keyW, tutorial34W);
      image(tutorialPrismstone, tutorial34X, tutorial34Y + tutorial34Spacing * 3, tutorial34W, tutorial34W);
      image(tutorialExitClosed, tutorial34X, tutorial34Y + tutorial34Spacing * 5, exitW, exitW);
      image(tutorialExitOpen, tutorial34X, tutorial34Y + tutorial34Spacing * 6, exitW, exitW);

      textSize(25);
      textAlign(CENTER, BOTTOM);
      text("These are things you can find and/or use in the maze", textTutorial34X, tutorial34Y);
      textAlign(LEFT, CENTER);
      text("COIN: increases score by 10.", textTutorial34X2, tutorial34Y + tutorial34Spacing);
      text("KEY: Collect 3 of these to open the exit gate.", textTutorial34X2, tutorial34Y + tutorial34Spacing * 2);
      text("PRISMSTONE: Drop these by pressing A, to remember where to go or not to go.", textTutorial34X2, tutorial34Y + tutorial34Spacing * 3);
      text("EXITGATE-CLOSED: The exit gate before you find all the keys.", textTutorial34X2, tutorial34Y + tutorial34Spacing * 4);
      text("EXITGATE-OPEN: Press S to enter the gate and move on to the next level.", textTutorial34X2, tutorial34Y + tutorial34Spacing * 5);

      textAlign(RIGHT, BOTTOM);
      text("Press X to continue", textContinueX, textContinueY);
      textAlign(LEFT, BOTTOM);
      text("Press S to go back", textGobackX, textGobackY);
      textAlign(CENTER, BOTTOM);
      text("Press Z to exit", textExitX, textExitY);

      if (keyPressedOnce == false) {
        if (keysPressed['Z']) {
          menu.tutorialShow = false;
          keyPressedOnce = true;
        }
      }
    }

    if (tutorial4) {
      background(0);
      image(tutorialPowerup1, tutorial34X, tutorial34Y + tutorial34Spacing, tutorial34W, tutorial34W);
      image(tutorialPowerup2, tutorial34X, tutorial34Y + tutorial34Spacing * 2, tutorial34W, tutorial34W);
      image(tutorialPowerup3, tutorial34X, tutorial34Y + tutorial34Spacing * 3, tutorial34W, tutorial34W);
      image(tutorialPowerup4, tutorial34X, tutorial34Y + tutorial34Spacing * 4, tutorial34W, tutorial34W);
      image(tutorialPowerup5, tutorial34X, tutorial34Y + tutorial34Spacing * 5, tutorial34W, tutorial34W);
      imageMode(CENTER);

      textSize(25);
      textAlign(CENTER, BOTTOM);
      text("These are the powerups. Every powerup lasts for 5 seconds.", textTutorial34X, tutorial34Y);
      textAlign(CENTER, TOP);
      text("Press S to pick up a powerup. Then press X to activate a powerup.", textTutorial34X, tutorial34Y);
      textAlign(LEFT, CENTER);
      text("RADAR: Shows the location of the enemy(s).", textTutorial34X2, tutorial34Y + tutorial34Spacing);
      text("LIGHT: Shows the location of the walls of the maze.", textTutorial34X2, tutorial34Y + tutorial34Spacing * 2);
      text("WHISTLE: Stuns the enemy, so it can't move", textTutorial34X2, tutorial34Y + tutorial34Spacing * 3);
      text("POTION: Increases your walk speed.", textTutorial34X2, tutorial34Y + tutorial34Spacing * 4);
      text("X-RAY: Shows the location of the nearest key.", textTutorial34X2, tutorial34Y + tutorial34Spacing * 5);

      textAlign(RIGHT, BOTTOM);
      text("Press X to continue", textContinueX, textContinueY);
      textAlign(LEFT, BOTTOM);
      text("Press S to go back", textGobackX, textGobackY);
      textAlign(CENTER, BOTTOM);
      text("Press Z to exit", textExitX, textExitY);

      if (keyPressedOnce == false) {
        if (keysPressed['Z']) {
          menu.tutorialShow = false;
          keyPressedOnce = true;
        }
      }
      textSize(25);
    }
  }
}
