Player player = new Player();

class Player
{
  float x = 150;
  float y = 100;
  float speed = 2;
  boolean A, S, Z, X;

  void update()
  {
    Move();
  }

  void draw()
  {
    fill(0, 255, 0);
    ellipse(x, y, 50, 50);
  }

  void Move() {
    if (keysPressed[37] && x > 25) {
      x-=speed;
    }  
    if (keysPressed[39] && x < width - 25) {
      x+=speed;
    }  
    if (keysPressed[38] && y > 25) {
      y-=speed;
    }  
    if (keysPressed[40] && y < height - 25) {
      y+=speed;
    }
  }
}
