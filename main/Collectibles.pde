CoinHandler coinHandler = new CoinHandler();
boolean createCoinOnce;
class CoinHandler {
  int coinAmount = 10;
  Coin[] coins = new Coin[coinAmount];
  int score;

  void createCoin() {
    if (createCoinOnce == false) {
      for (int i = 0; i < coinAmount; i++) {
        coins[i] = new Coin();
        for (int j = 0; j < keyHandler.keyAmount; j++) {
          int randomGetal = int(random(grid.grid.size()));
          if (randomGetal == keyHandler.keys[j].keyLocation) {
            createCoin();
            println( "<3");
          } else {
            coins[i].coinX = grid.grid.get(randomGetal).x * grid.w + grid.w/2;
            coins[i].coinY = grid.grid.get(randomGetal).y * grid.w + grid.w/2;
            coins[i].d = 15;
            score = 0;
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
      fill(255, 255, 0);
      circle(coins[i].coinX, coins[i].coinY, coins[i].d);
      if (afstandX <= coins[i].d/2 + player.playerW/2 && afstandY <= coins[i].d/2 + player.playerW) {
        score += 10;
        coins[i].coinX = -10;
      }
    }
  }
}

class Coin {
  float coinX, coinY, d;
  int coinLocation;
}
