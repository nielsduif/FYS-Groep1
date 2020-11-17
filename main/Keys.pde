//author = Tiara Vrossink, 500857262
//purpose = Creation of the keys needed to open the exit

KeyHandler keyHandler = new KeyHandler();
boolean createKeyOnce;
//Maak class aan om de keys aan te maken en te updaten
class KeyHandler {
  PImage keyImage;
  int keyH = 15;
  int keyW = 7;
  int keyAmount = 3;
  Keys[] keys = new Keys[keyAmount];
  int count = 3;
  void createKeys() {
    if (createKeyOnce == false) { //Check of er al een key is op de plaats waar de key wil spawnen, plaats de key alleen op plekken waar er nog geen andere key is
      for (int i = 0; i < keyAmount; i++) { //Bepaal random plaats in het grid waar de key spawned
        keys[i] = new Keys(); //Maak de keys aan
        int randomGetal = int(random(grid.grid.size()/3 * (i + 1)));
        keys[i].keyLocation = randomGetal;
        keys[i].keyX = grid.grid.get(randomGetal).x * grid.w + grid.w/2;
        keys[i].keyY = grid.grid.get(randomGetal).y * grid.w + grid.w/2;
        keys[i].d = 10;
        createKeyOnce = true; //Maak het zo dat de volgende key weet dat op deze plaats al een coin staat
      }
    }
  }

  void updateKeys() {
    for (int i = 0; i < keyAmount; i++) {
      if (keys[i] != null) {
        float afstandX = abs(keys[i].keyX - player.x);
        float afstandY = abs(keys[i].keyY - player.y);
        //fill(255);
        //circle(keys[i].keyX, keys[i].keyY, keys[i].d);
        player.drawObjectInView(keyImage, keys[i].keyX, keys[i].keyY, grid.w * keyW / 60, grid.w * keyH / 60);
        //circle(keys[i].keyX, keys[i].keyY, keys[i].d);
        if (afstandX <= keys[i].d/2 + player.playerW/2 && afstandY <= keys[i].d/2 + player.playerW/2) { //Check of de player over de key heen loopt
          count--; //Verlaag aantal benodigde keys met 1
          keys[i] = null; //Verwijder de key
        }
      }
    }
  }

  void updateKeyUI() {
    //Laat zien hoeveel keys je nog moet vinden en laat het zien dat de exit opent als je alle keys hebt
    if (count == 0) {
      fill(255);
      textSize(30);
      text("Exit is open!", width - 325, prismStone.textY + score.textSpace*2);
      tileSet.exitGateOpen = true;
    } else {
      fill(255);
      textSize(30);
      text("Keys needed: " + count, width - 325, prismStone.textY + score.textSpace*2);
    }
  }
}

//Roep de variabelen in deze aparte class op, zodat alle keys hun eigen waarden kunnen hebben
class Keys {
  float keyX, keyY, d;
  int keyLocation;
}
