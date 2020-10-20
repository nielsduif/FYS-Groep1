Keys keys = new Keys();
class Keys {
  float keyX, keyY, d;
  int count;
  boolean exitOpen;
  void createKeys() {
    int randomGetal = int(random(grid.grid.size()));
    keyX = grid.grid.get(randomGetal).x * grid.w + grid.w/2;
    keyY = grid.grid.get(randomGetal).y * grid.w + grid.w/2;
    d = 10;
    count = 0;
  }

  void updateKeys() {
    float afstandX = abs(keyX - player.x);
    float afstandY = abs(keyY - player.y);
    for (int i = 0; i < 3; i++) {
      fill(255);
      circle(keyX, keyY, d);
      if (afstandX <= d/2 + player.playerW/2 && afstandY <= d/2 + player.playerW/2) {
        count += 1;
        keyX = -10;
      }
    }
    if (count == 3) {
      exitOpen = true;
      println ("exit open");
    }
  }
}
