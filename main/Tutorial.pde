
Tutorial tutorial = new Tutorial();
class Tutorial {
  PImage tutorialPlayerImage, tutorialMonsterImage, 
    tutorialPowerup1, tutorialPowerup2, tutorialPowerup3, tutorialPowerup4, tutorialPowerup5, 
    tutorialCoin, tutorialKey, tutorialPrismstone;
  float playerX, playerY, playerW, playerH;
  float monsterX, monsterY, monsterW, monsterH;
  float powerupX, powerupY, powerupSpacing, powerupW;
  float coinX, coinY, keyX, keyY, prismstoneX, prismstoneY, tutorial3W;
  float textRightX, textRightY, textLeftX, textLeftY, textUpX, textUpY, textDownX, textDownY;
  float textMonster1X, textMonster1Y, textMonster2X, textMonster2Y, textMonster3X, textMonster3Y;
  float textPowerupX, textPowerupX2;
  float textContinueX, textContinueY, textExitX, textExitY;
  int powerupAmount = 5;
  boolean tutorial1, tutorial2, tutorial3, tutorial4;
  boolean keyPressedOnce;
  void setup() {
    tutorialPlayerImage = loadImage("player.png");
    tutorialMonsterImage = loadImage("monster.png");
    tutorialPowerup1 = loadImage("ping.png"); 
    tutorialPowerup2 = loadImage("vision.png");
    tutorialPowerup3 = loadImage("whistle.png"); 
    tutorialPowerup4 = loadImage("potion.png");
    tutorialPowerup5 = loadImage("xray.png");
    tutorialCoin = loadImage("Coin.png");
    tutorialKey = loadImage("Key.png");
    tutorialPrismstone = loadImage("PrismStone.png");
    playerX = width/2;
    playerY = height/2 - playerH;
    playerW = width/10;
    playerH = playerW * 2;
    monsterX = width/2;
    monsterY = height/2;
    monsterW = width/10;
    monsterH = playerW *2;
    powerupX = width/4;
    powerupY = height/7 + powerupW;
    powerupSpacing = height/7;
    powerupW = height/8;

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
    textMonster3Y = monsterY + monsterH;
    textPowerupX = width/2;
    textPowerupX2 = powerupX + powerupW;
    textContinueX = playerX;
    textContinueY = playerY + playerH;
    textExitX = 0;
    textExitY = 0;
  }

  void display() {
    println(tutorial1, tutorial2, tutorial3, keyPressedOnce);
    if (!keysPressed['X']) {
      keyPressedOnce = false;
    }
    if (tutorial2) {
      tutorial1 = false;
      tutorial3 = false;
      if (keyPressedOnce == false) {
        if (keysPressed['X']) {
          keyPressedOnce = true;
          tutorial2 = false;
          tutorial3 = true;
        }
        if (!keysPressed['X']) {
          keyPressedOnce = false;
        }
      }
    } else if (tutorial3) {
      tutorial1 = false;
      tutorial2 = false;
      tutorial4 = false;
      if (keyPressedOnce == false) {
        if (keysPressed['X']) {
          keyPressedOnce = true;
          tutorial3 = false;
          tutorial4 = true;
        }
        if (!keysPressed['X']) {
          keyPressedOnce = false;
        }
      }
    } else if (tutorial4) {
      tutorial1 = false; 
      tutorial2 = false; 
      tutorial3 = false;
      if (keyPressedOnce == false) {
        if (keysPressed['X']) {
          keyPressedOnce = true;
          menu.tutorialShow = false;
        }
        if (!keysPressed['X']) {
          keyPressedOnce = false;
        }
      }
    }
    { 
      tutorial1 = true;
    }
    if (tutorial1) {
      tutorial2 = false;
      tutorial3 = false;
      background(0);
      image(tutorialPlayerImage, playerX, playerY, playerW, playerH);
      imageMode(CENTER);

      textSize(20);
      fill(255);
      textAlign(LEFT, CENTER);
      text("Press → to move right", textRightX, textRightY);
      textAlign(RIGHT, CENTER);
      text("Press ← to move left", textLeftX, textLeftY);
      textAlign(CENTER, BOTTOM);
      text("Press ↑ to move up", textUpX, textUpY);
      textAlign(CENTER, TOP);
      text("Press ↓ to move down", textDownX, textDownY);
      textAlign(CENTER);
      text("Press X to continue", textContinueX, textContinueY);
      textAlign(LEFT, TOP);
      text("Press Z to exit", textExitX, textExitY);

      if (keyPressedOnce == false) {
        if (keysPressed['Z']) {
          keyPressedOnce = true;
          menu.tutorialShow = false;
        }
        if (keysPressed['X']) {
          keyPressedOnce = true;
          tutorial1 = false;
          tutorial2 = true;
        }
        if (!keysPressed['X'] && !keysPressed['Z']) {
          keyPressedOnce = false;
        }
      }
    }


    if (tutorial2) {
      background(0);
      image(tutorialMonsterImage, monsterX, monsterY, monsterW, monsterH);
      imageMode(CENTER);

      textSize(30);
      fill(255, 0, 0);
      textAlign(CENTER, BOTTOM);
      text("This is the enemy!", textMonster1X, textMonster1Y);
      textAlign(CENTER, TOP);
      text("The enemy will chase you and kill you immediately!", textMonster2X, textMonster2Y);
      textAlign(CENTER, BOTTOM);
      textSize(20);
      fill(255);
      text("Press A to preview how the enemy looks while chasing you", textMonster3X, textMonster3Y);
      textAlign(CENTER, TOP);
      text("Press X to continue", textContinueX, textContinueY);
      textAlign(LEFT, TOP);
      text("Press Z to exit", textExitX, textExitY);

      if (keyPressedOnce == false) {
        if (keysPressed['A']) {
          keyPressedOnce = true;
        }
        if (keysPressed['Z']) {
          keyPressedOnce = true;
          menu.tutorialShow = false;
        }
        if (!keysPressed['A'] && !keysPressed['Z']) {
          keyPressedOnce = false;
        }
      }
    }

    if (tutorial3) {
      background(0);
      image(tutorialCoin, coinX, coinY, tutorial3W, tutorial3W);
      image(tutorialKey, keyX, keyY, tutorial3W, tutorial3W);
      image(tutorialPrismstone, prismstoneX, prismstoneY, tutorial3W, tutorial3W);
      imageMode(CENTER);
    }

    if (tutorial4) {
      background(0);
      image(tutorialPowerup1, powerupX, powerupY + powerupSpacing, powerupW, powerupW);
      image(tutorialPowerup2, powerupX, powerupY + powerupSpacing * 2, powerupW, powerupW);
      image(tutorialPowerup3, powerupX, powerupY + powerupSpacing * 3, powerupW, powerupW);
      image(tutorialPowerup4, powerupX, powerupY + powerupSpacing * 4, powerupW, powerupW);
      image(tutorialPowerup5, powerupX, powerupY + powerupSpacing * 5, powerupW, powerupW);
      imageMode(CENTER);

      textAlign(CENTER, BOTTOM);
      text("These are the powerups. Every powerup lasts for 5 seconds.", textPowerupX, powerupY);
      textAlign(CENTER, TOP);
      text("Press S to pick a powerup up. Then press X to activate a powerup.", textPowerupX, powerupY);
      textAlign(LEFT, CENTER);
      text("RADAR: Shows the location of the enemy(s).", textPowerupX2, powerupY + powerupSpacing);
      text("LIGHT: Shows the location of the walls of the maze.", textPowerupX2, powerupY + powerupSpacing * 2);
      text("WHISTLE: Stuns the enemy, so it can't move or kill you.", textPowerupX2, powerupY + powerupSpacing * 3);
      text("POTION: Increases your walk speed.", textPowerupX2, powerupY + powerupSpacing * 4);
      text("X-RAY: Shows the location of the nearest key.", textPowerupX2, powerupY + powerupSpacing * 5);
    }
    textSize(25);
  }
}
