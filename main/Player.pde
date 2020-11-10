Player player = new Player();

class Player
{
  PImage playerImage;
  float x = grid.w * .5; 
  float y = grid.w * .5;
  float prevX = x, prevY = y;
  float tileLocationX;
  float tileLocationY;
  float playerW = (grid.w / 3) - 10;
  float playerH = playerW * 2;
  float speed = 3 * grid.w / 100;

  void update()
  {
    move();
    collision();
    if (tileSet.exitGateOpen == true) {
    }
  }

  void draw()
  {
    fill(50, 50, 50, 100);
    circle(x, y, playerW); // player shadow
    imageMode(CENTER);
    //circle(x, y, playerW); collision reference
    image(playerImage, x, y - playerH / 2, playerW, playerH);
    imageMode(CORNER);
  }

  void move() {
    tileLocationX = floor(player.x / grid.w);
    tileLocationY = floor(player.y / grid.w);

    if (keysPressed[37]) {
      x-=speed;
    }  
    if (keysPressed[39]) {
      x+=speed;
    }  
    if (keysPressed[38]) {
      y-=speed;
    }  
    if (keysPressed[40]) {
      y+=speed;
    }
  }

  void collision() {
    float wallU = 0, wallR = width, wallD = height, wallL = 0;
    boolean corner = false;
    for (int i = 0; i < grid.grid.size(); i++) {
      if (player.tileLocationX == grid.grid.get(i).x && player.tileLocationY == grid.grid.get(i).y) {
        if (grid.grid.get(i).walls[0] == true) {
          wallU = (grid.w * grid.grid.get(i).y) + (grid.w / 3);
        }
        if (grid.grid.get(i).walls[1] == true) {
          wallR = (grid.w * (grid.grid.get(i).x + 1)) - (grid.w / 3);
        }
        if (grid.grid.get(i).walls[2] == true) {
          wallD = (grid.w * (grid.grid.get(i).y + 1)) - (grid.w / 3);
        }
        if (grid.grid.get(i).walls[3] == true) {
          wallL = (grid.w * grid.grid.get(i).x) + (grid.w / 3);
        }
        if (
          x - playerW / 2 <= (grid.w * grid.grid.get(i).x) + (grid.w / 3) && y - playerW / 2 <= (grid.w * grid.grid.get(i).y) + (grid.w / 3) ||
          x + playerW / 2 >= (grid.w * (grid.grid.get(i).x + 1)) - (grid.w / 3) && y - playerW / 2 <= (grid.w * grid.grid.get(i).y) + (grid.w / 3) ||
          x - playerW / 2 <= (grid.w * grid.grid.get(i).x) + (grid.w / 3) && y >= (grid.w * (grid.grid.get(i).y + 1)) - (grid.w / 3) ||
          x + playerW / 2 >= (grid.w * (grid.grid.get(i).x + 1)) - (grid.w / 3) && y >= (grid.w * (grid.grid.get(i).y + 1)) - (grid.w / 3)
          ) {
          corner = true;
        }
      }
    }
    if (x - playerW / 2 <= wallL || x + playerW / 2 >= wallR) {
      x = prevX;
    }
    if (y - playerW / 2 <= wallU || y >= wallD) {
      y = prevY;
    }
    if (corner == true) {
      x = prevX;
      y = prevY;
    }
    prevX = x;
    prevY = y;
  }

  void drawObjectInView(PImage pImage, float pObjectX, float pObjectY, float pObjectW, float pObjectH) {
    for (int i = 0; i < grid.grid.size(); i++) {
      float objectTileX = floor(pObjectX / grid.w);
      float objectTileY = floor(pObjectY / grid.w);
      if (grid.grid.get(i).x == objectTileX && grid.grid.get(i).y == objectTileY && grid.grid.get(i).isDrawn == true) {
        imageMode(CENTER);
        image(pImage, pObjectX, pObjectY, pObjectW, pObjectH);
        imageMode(CORNER);
      }
    }
  }
}
