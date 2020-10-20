KeyHandler keyHandler = new KeyHandler();
boolean createKeyOnce;
class KeyHandler {
  PImage keyImage;
  int keyH = 15;
  int keyW = 7;
  int keyAmount = 3;
  Keys[] keys = new Keys[keyAmount];
  int count = 0;
  void createKeys() {
    if (createKeyOnce == false) {
      for (int i = 0; i < keyAmount; i++) {
        keys[i] = new Keys();
        int randomGetal = int(random(grid.grid.size()/3 * (i + 1)));
        keys[i].keyLocation = randomGetal;
        keys[i].keyX = grid.grid.get(randomGetal).x * grid.w + grid.w/2;
        keys[i].keyY = grid.grid.get(randomGetal).y * grid.w + grid.w/2;
        keys[i].d = 10;
        createKeyOnce = true;
      }
    }
  }

  void updateKeys() {
    for (int i = 0; i < keyAmount; i++) {
      float afstandX = abs(keys[i].keyX - player.x);
      float afstandY = abs(keys[i].keyY - player.y);

      imageMode(CENTER);
      image(keyImage, keys[i].keyX, keys[i].keyY, grid.w * keyW / 60, grid.w * keyH / 60);
      imageMode(CORNER);
      //circle(keys[i].keyX, keys[i].keyY, keys[i].d);
      if (afstandX <= keys[i].d/2 + player.playerW/2 && afstandY <= keys[i].d/2 + player.playerW/2) {
        keys[i].keyX = -10;
        count++;
      }
    }
    if (count == keyAmount) {
      tileSet.exitGateOpen = true;
      println ("exit open");
    }
  }
}
class Keys {
  float keyX, keyY, d;
  int keyLocation;
}
