//author = Tiara Vrossink, 500857262
//purpose = creating the collectibles, such as the coins

CoinHandler coinHandler = new CoinHandler();
boolean createCoinOnce;

//maak de class aan voor het maken en updaten van de coins
class CoinHandler {
  int coinAmount = 10;
  PImage coinImage;
  int coinW = 10;
  int coinH = 10;
  int coinCount;
  Coin[] coins = new Coin[coinAmount];

  void createCoin() {
    if (createCoinOnce == false) { //check of er al een coin is op de plaats waar de coin wil spawnen, plaats de coin alleen op plekken waar er nog geen andere coin is
      for (int i = 0; i < coinAmount; i++) { //bepaal random plaats in het grid waar de coin spawned
        coins[i] = new Coin(); //maak de coins aan
        int randomGetal = getRandomUnUsedTile();
        if (grid.grid.get(randomGetal).isUsed == true) { //zorg ervoor dat coins en keys niet op dezelfde plek komen te staan
          createCoin();
        } else {
          grid.grid.get(randomGetal).isUsed = true;
          coins[i].coinX = grid.grid.get(randomGetal).x * grid.w + grid.w/2;
          coins[i].coinY = grid.grid.get(randomGetal).y * grid.w + grid.w/2;
          coins[i].d = 15;
        }
      }
      createCoinOnce = true; //maak het zo dat de volgende coin weet dat op deze plaats al een coin staat
    }
  }

  void updateCoin() {
    for (int i = 0; i < coinAmount; i++) {
      if (coins[i] != null) {
        float afstandX = abs(coins[i].coinX - player.x);
        float afstandY = abs(coins[i].coinY - player.y);
        //fill(255, 255, 0);
        //circle(coins[i].coinX, coins[i].coinY, coins[i].d);
        player.drawObjectInView(coinImage, coins[i].coinX, coins[i].coinY, grid.w * coinW / 60, grid.w * coinH / 60);
        if (afstandX <= coins[i].d/2 + player.playerW/2 && afstandY <= coins[i].d/2 + player.playerW) { //check of speler over een coin heen loopt
          score.score += 10; //verhoog de score
          coinCount -= 1;
          coins[i] = null; //verwijder de coin
          playSound(coinPickup);
        }
      }
    }
  }

  int getRandomUnUsedTile() {
    int getal = getRandomTile();
    while (grid.grid.get(getal).isUsed == true) {
      getal = getRandomTile();
    }
    if (grid.grid.get(getal).isUsed == false) {
      return getal;
    }
    return 0;
  }

  private int getRandomTile() {
    return int(random(1, grid.grid.size()));
  }
}

//roep de variabelen in deze aparte class op, zodat alle coins hun eigen waarden kunnen hebben
class Coin {
  float coinX, coinY, d;
}
