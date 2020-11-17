//author = Tiara Vrossink, 500857262
//purpose = creating the gameover screen

GameOver gameOver = new GameOver();
//maak het gameover scherm aan
class GameOver {
  float gameoverX, gameoverY;
  float restartX, restartY;
  float quitX, quitY;
  void showGameOver() {
    gameoverX = width/2;
    gameoverY = height/2;
    restartX = gameoverX;
    restartY = gameoverY +100;
    quitX = gameoverX;
    quitY = restartY + 100;
    background(0); 
    fill(255, 0, 0);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Gameover", gameoverX, gameoverY);
    textSize(80);
    textAlign(CENTER, CENTER);
    text("Press 'z' to restart", restartX, restartY);
    textSize(80);
    textAlign(CENTER, CENTER);
    text("Press 'x' to quit", quitX, quitY);

    if (keyPressed) {
      if (key == 'z' || key == 'Z') {
        //ga naar beginscherm
      }
      if (key == 'x' || key == 'X') {
        exit();
      }
    }
  }
}
