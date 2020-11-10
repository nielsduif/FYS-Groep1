CoinHandler coinHandler = new CoinHandler();
boolean createCoinOnce;

//Maak de class aan voor het maken en updaten van de coins
class CoinHandler {
  int coinAmount = 10;
  PImage coinImage;
  int coinW = 10;
  int coinH = 11;
  Coin[] coins = new Coin[coinAmount];

  void createCoin() {
    if (createCoinOnce == false) { //Check of er al een coin is op de plaats waar de coin wil spawnen, plaats de coin alleen op plekken waar er nog geen andere coin is
      for (int i = 0; i < coinAmount; i++) { //Bepaal random plaats in het grid waar de coin spawned
        coins[i] = new Coin();
        for (int j = 0; j < keyHandler.keyAmount; j++) {
          int randomGetal = int(random(grid.grid.size()));
          if (randomGetal == keyHandler.keys[j].keyLocation) { //Zorg ervoor dat coins en keys niet op dezelfde plek komen te staan
            createCoin();
          } else {
            coins[i].coinX = grid.grid.get(randomGetal).x * grid.w + grid.w/2;
            coins[i].coinY = grid.grid.get(randomGetal).y * grid.w + grid.w/2;
            coins[i].d = 15;
          }
        }
      }
      createCoinOnce = true; //Maak het zo dat de volgende coin weet dat op deze plaats al een coin staat
    }
  }

  void updateCoin() {
    for (int i = 0; i < coinAmount; i++) { //Maak de coins aan
      if (coins[i] != null) {
        float afstandX = abs(coins[i].coinX - player.x);
        float afstandY = abs(coins[i].coinY - player.y);
        //fill(255, 255, 0);
        //circle(coins[i].coinX, coins[i].coinY, coins[i].d);
        player.drawObjectInView(coinImage, coins[i].coinX, coins[i].coinY, grid.w * coinW / 60, grid.w * coinH / 60);
        if (afstandX <= coins[i].d/2 + player.playerW/2 && afstandY <= coins[i].d/2 + player.playerW) { //Check of speler over coin heen loopt
          score.score += 10; //Verhoog de score
          coins[i] = null; //Verwijder de coin
        }
      }
    }
  }
}

//Roep de variabelen in deze aparte class op, zodat alle coins hun eigen waarden kunnen hebben
class Coin {
  float coinX, coinY, d;
}
