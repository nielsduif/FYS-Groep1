GameOver gameOver = new GameOver();
class GameOver {
  void showGameOver() {
    background(0);
    fill(255, 0, 0);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Game Over", width/2, height/2);
    player.speed = 0;
  }
}
