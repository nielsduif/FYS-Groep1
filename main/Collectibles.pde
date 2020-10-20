Collectibles coins = new Collectibles();
class Collectibles {
  float coinX, coinY, d;
  int score;
  void createCoin() {
    int randomGetal = int(random(grid.grid.size()));
    coinX = grid.grid.get(randomGetal).x * grid.w + grid.w/2;
    coinY = grid.grid.get(randomGetal).y * grid.w + grid.w/2;
    d = 15;
    score = 0;
  }

  void updateCoin() {
    float afstandX = abs(coinX - player.x);
    float afstandY = abs(coinY - player.y);
    for (int i = 0; i < 20; i++) {
      fill(255, 255, 0);
      circle(coinX, coinY, d);
      if (afstandX <= d/2 + player.playerW/2 && afstandY <= d/2 + player.playerW) {
        score += 10;
        coinX = -10;
      }
    }
  }
}
