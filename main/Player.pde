class Player

{

  float x = 150;
  float y = 100;
  float speed = 2;
  boolean A, S, Z, X;
  int points = 0;



  void update()
  {
    display();
    Move();
    textSize (32);
    text("points:", 20, 35);
  }

  void display()
  {
    fill(0, 255, 0);
    ellipse(x, y, 50, 50);
  }

  void Move() {
    if (A && x > 25) {
      x-=speed;
    }  
    if (S && x < width - 25) {
      x+=speed;
    }  
    if (Z && y > 25) {
      y-=speed;
    }  
    if (X && y < height - 25) {
      y+=speed;
    }
  }

  void keyPressed() {
    if (key == 'a' || key == 'A') {
      A = true;
    }
    if (key == 's' || key == 'S') {
      S = true;
    }
    if (key == 'z' || key == 'Z') {
      Z = true;
    }
    if (key == 'x' || key == 'X') {
      X = true;
    }
  }

  void keyReleased() {
    if (key == 'a' || key == 'A') {
      A = false;
    }
    if (key == 's' || key == 'S') {
      S = false;
    }
    if (key == 'z' || key == 'Z') {
      Z = false;
    }
    if (key == 'x' || key == 'X') {
      X = false;
    }
  }
}
