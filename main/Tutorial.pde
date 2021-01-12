
Tutorial tutorial = new Tutorial();
class Tutorial {
  PImage tutorialPlayerImage;
  PImage tutorialMonsterImage;
  float playerX, playerY, playerW, playerH;
  float monsterX, monsterY, monsterW, monsterH;
  float textRightX, textRightY, textLeftX, textLeftY, textUpX, textUpY, textDownX, textDownY;
  float textMonster1X, textMonster1Y, textMonster2X, textMonster2Y;
  float textContinueX, textContinueY, textExitX, textExitY;
  boolean tutorial1, tutorial2, tutorial3;
  void setup() {
    tutorialPlayerImage = loadImage("player.png");
    tutorialMonsterImage = loadImage("monster.png");
    playerX = width/2;
    playerY = height/2 - playerH;
    playerW = width/10;
    playerH = playerW * 2;
    monsterX = width/2;
    monsterY = height/2;
    monsterW = width/10;
    monsterH = playerW *2;
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
    textContinueX = playerX;
    textContinueY = playerY + playerH;
    textExitX = 0;
    textExitY = 0;
  }

  void display() {
    tutorial1 = true;

    if (tutorial1) {
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

      if (keyPressed) {
        if (key == 'x' || key == 'X') {
          tutorial1 = false;
          tutorial2 = true;
        }

        if (key == 'z' || key == 'Z') {
          menu.tutorialShow = false;
        }
      }
    }

    if (tutorial2) {
      background(0);
      image(tutorialMonsterImage, monsterX, monsterY, monsterW, monsterH);
      imageMode(CENTER);
      
      textSize(30);
      fill(255, 0, 0);
      textAlign(CENTER);
      text("This is the enemy!", textMonster1X, textMonster1Y);
      
      
    }
    textSize(25);
  }
}
