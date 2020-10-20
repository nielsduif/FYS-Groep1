class GameOver {
  float x, y, d;
  String text = "Game over";
  float textX, textY;
  void createGameOver() {
    x = random(width);
    y = random(height);
    d = 20;
  }
  void updateGameOver() {
    fill(255, 0, 0);
    circle(x, y, d);
    float afstandX = abs(x- player.x);
    float afstandY = abs(y- player.y);
    if (afstandX <= d/2 + player.playerW/2 && afstandY <= d/2 + player.playerW/2) {
      background(0);
      fill(255, 0, 0);
      textSize(100);
      textAlign(CENTER, CENTER);
      text(text, textX, textY);
      player.speed = 0;
    }
  }
}
