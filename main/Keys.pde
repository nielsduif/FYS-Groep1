//author = Tiara Vrossink, 500857262
//purpose = Creation of the keys needed to open the exit

KeyHandler keyHandler = new KeyHandler();
Keys keys = new Keys();
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
        int randomGetal = coinHandler.getRandomUnUsedTile();
        if (grid.grid.get(randomGetal).isUsed == true) {
          createKeys();
        } else {
          grid.grid.get(randomGetal).isUsed = true;
          keys[i].keyX = grid.grid.get(randomGetal).x * grid.w + grid.w/2;
          keys[i].keyY = grid.grid.get(randomGetal).y * grid.w + grid.w/2;
          keys[i].d = 10;
          createKeyOnce = true; //Maak het zo dat de volgende key weet dat op deze plaats al een key staat
        }
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
    Keys closestKey = null;
    float closestDistance = 999999999; //deze moet de eerste keer altijd hoger zijn dan de afstand tot de key
    if (frameCount >= powerupHandler.arrowTime + 180 && powerupHandler.startArrowTimer == true) { //dit is de timer voor de arrow powerup, de timer loopt voor 3 seconden
      powerupHandler.startArrowTimer = false;
    }
    if (powerupHandler.startArrowTimer == true) {
      for (int i = 0; i < keys.length; i++) { //check elke key
        if (keys[i] != null) { //zorg ervoor dat het checken ook mogelijk is met minder dan 3 keys in het spel
          powerupHandler.keyDistance = dist(player.x, player.y, keys[i].keyX, keys[i].keyY); //bepaal de afstand tussen de player en de keys
          //println(powerupHandler.keyDistance);
          if (powerupHandler.keyDistance < closestDistance) { //check of de key die gechecked wordt dichter bij de speler is dan de vorige die gechecked werd
            closestKey = keys[i];
            closestDistance = powerupHandler.keyDistance;  //stel de nieuwe afstand vast als dichtst bijzijnde
          }
        }
      }
      if (closestKey != null) { //zorg ervoor dat het volgende pas werkt als de key die het dichtst bij staat bepaald is
        //println(closestKey.keyX / grid.w+ "; " + closestKey.keyY / grid.w);
        imageMode(CENTER);
        image(keyHandler.keyImage, closestKey.keyX, closestKey.keyY, grid.w * keyW / 60, grid.w * keyH / 60); //teken de key die het dichtst bij staat bij de player
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
      if (tileSet.playExitSoundOnce == false) {
        playSound(exitOpen);
        tileSet.playExitSoundOnce = true;
      }
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
}
