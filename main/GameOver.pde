//author = Tiara Vrossink, 500857262
//purpose = creating the gameover screen

GameOver gameOver = new GameOver();
//maak het gameover scherm aan
class GameOver {
  boolean gameIsOver;
  boolean jumpscareIsPlaying;
  float gameoverX, gameoverY;
  float restartX, restartY;
  float quitX, quitY;
  float jumpscareX, jumpscareY, jumpscareW = 100, jumpscareH;
  PImage jumpscareImage;
  void showGameOver() {
    gameIsOver = true;
    jumpscareIsPlaying = false;
    gameoverX = width/2;
    gameoverY = height/2;
    restartX = gameoverX;
    restartY = gameoverY + 100;
    quitX = gameoverX;
    quitY = restartY + 100;
    player.speed = 0; //zorg ervoor dat de speler niet meer kan lopen zodat het spel niet meer gespeeld kan worden
    player.potionSpeed = 0; //doe dit ook met de snelheid die je van de potion krijgt, zodat de speler niet opeens weer kan lopen als de potion voorbij is, terwijl de speler dood is
    background(0); 
    fill(255, 0, 0);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("GameOver", gameoverX, gameoverY);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("Press 'z' to restart", restartX, restartY);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("Press 'x' to quit", quitX, quitY);

    if (!database.added) {
      database.addToHighscore();
    }

    if (keyPressed) {
      if (key == 'z' || key == 'Z') { //restart de game door op z te drukken
        database.added = false;
        levelSizer.generateStart();
      }
      if (key == 'x' || key == 'X') { //sluit de game af door op x te drukken
        exit();
      }
    }
  }

  //speelt de jumpscare wanneer je gepakt bent
  void jumpScare() { 
    jumpscareIsPlaying = true;
    monsterFootsteps.stop();
    player.speed = 0;
    if (jumpscare.isPlaying()) {
      background(255, 0, 0);
      jumpscareW += 3;
      jumpscareH = jumpscareW * 2;
      //shake effect
      jumpscareX = random(width/2 - 10, width/2 + 10);
      jumpscareY = random(height/2 + 200, height/2 + 20);
      imageMode(CENTER);
      image(jumpscareImage, jumpscareX, jumpscareY, jumpscareW, jumpscareH);
      imageMode(CORNER);
    } else {
      showGameOver();
    }
  }
}
