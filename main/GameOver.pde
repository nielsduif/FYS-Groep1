GameOver gameOver = new GameOver();
class GameOver {
  String text = "Game over";
  float textX, textY;
  void showGameOver() {
    background(0);
    fill(255, 0, 0);
    textSize(100);
    textAlign(CENTER, CENTER);
    text(text, textX, textY);
    player.speed = 0;
  }
}
