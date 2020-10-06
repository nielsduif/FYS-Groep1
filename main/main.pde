float ballX, ballY, ballD;
float wallW = 5;
float wallH = 200;
float walkSpeed = 5;

int wallAmount = 10;
Wall walls[] = new Wall[wallAmount];

float prevX, prevY;

void setup() {
  size(1600, 800);

  ballX = width/2;
  ballY = height/2;
  ballD = 20;
  for (int i = 0; i < walls.length; i++) {
    walls[i] = new Wall();
    walls[i].createWall();
  }
}

void draw() {
  background(0, 60, 90);
  fill(255);
  for (int i = 0; i < walls.length; i++) {
    walls[i].updateWall();
    float afstandX = abs(walls[i].wallX + wallW/2 - ballX);
    float afstandY = abs(walls[i].wallY + wallH/2 - ballY);
    if (afstandX <= ballD/2 + wallW/2 && afstandY <= ballD/2 + wallH/2) {
      ballX = prevX;
      ballY = prevY;
    }
  }
  prevX = ballX;
  prevY = ballY;

  circle(ballX, ballY, ballD);

  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      ballY -= walkSpeed;
    }
  }
  if (keyPressed) {
    if (key == 's'|| key == 'S') {
      ballY += walkSpeed;
    }
  }
  if (keyPressed) {
    if (key == 'a' || key == 'A') {
      ballX -= walkSpeed;
    }
  }
  if (keyPressed) {
    if (key == 'd'|| key == 'D') {
      ballX += walkSpeed;
    }
  }
}
