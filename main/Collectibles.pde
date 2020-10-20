CoinHandler coinHandler = new CoinHandler();
boolean createCoinOnce;
class CoinHandler {
  PImage coinImage;
  int coinW = 10;
  int coinH = 11;
  int coinAmount = 10;
  Coin[] coins = new Coin[coinAmount];

  void createCoin() {
    if (createCoinOnce == false) {
      for (int i = 0; i < coinAmount; i++) {
        coins[i] = new Coin();
        for (int j = 0; j < keyHandler.keyAmount; j++) {
          int randomGetal = int(random(grid.grid.size()));
          if (randomGetal == keyHandler.keys[j].keyLocation) {
            createCoin();
          } else {
            coins[i].coinX = grid.grid.get(randomGetal).x * grid.w + grid.w/2;
            coins[i].coinY = grid.grid.get(randomGetal).y * grid.w + grid.w/2;
            coins[i].d = 15;
          }
        }
      }
      createCoinOnce = true;
    }
  }

  void updateCoin() {
    for (int i = 0; i < coinAmount; i++) {
      float afstandX = abs(coins[i].coinX - player.x);
      float afstandY = abs(coins[i].coinY - player.y);
      //fill(255, 255, 0);
      imageMode(CENTER);
      image(coinImage, coins[i].coinX, coins[i].coinY, grid.w * coinW / 60, grid.w * coinH / 60);
      imageMode(CORNER);
      //circle(coins[i].coinX, coins[i].coinY, coins[i].d);
      if (afstandX <= coins[i].d/2 + player.playerW/2 && afstandY <= coins[i].d/2 + player.playerW) {
        score.score += 10;
        coins[i].coinX = -10;
      }
    }
  }
}

class Coin {
  float coinX, coinY, d;
  int coinLocation;
}
