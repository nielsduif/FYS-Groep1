//float ballX, ballY, ballD; //speler
//float walkSpeed = 5;
//String text = "Game over";
//float textX, textY;
//Monster theMonster;
//int coinAmount = 10;
//Coin coins[] = new Coin[coinAmount]; 


//float prevX, prevY;

//void setup() {
//  size(1600, 800);

//  for (int i = 0; i <10; i++) {
//    coins[i] = new Coin();
//    coins[i].createCoin();
//  }

//  theMonster = new Monster();
//  theMonster.createMonster();
//  textX = width/2;
//  textY = height/2;
//  ballX = width/2;
//  ballY = height/2;
//  ballD = 20;
//}
//void draw() {
//  background(0, 60, 90);
//  fill(255);
  
//  for(int i = 0; i < 10; i++){
//   coins[i].updateCoin(); 
//    if(
//  }

//  theMonster.updateMonster();
//  float afstandX = abs(theMonster.x- ballX);
//  float afstandY = abs(theMonster.y- ballY);
//  if (afstandX <= theMonster.d/2 + ballD/2 && afstandY <= theMonster.d/2 + ballD/2) {
//    background(0);
//    fill(255, 0, 0);
//    textSize(100);
//    textAlign(CENTER, CENTER);
//    text(text, textX, textY);
//    walkSpeed = 0;
//  }

//  prevX = ballX;
//  prevY = ballY;

//  circle(ballX, ballY, ballD);

//  if (keyPressed) {
//    if (key == 'w' || key == 'W') {
//      ballY -= walkSpeed;
//    }
//  }
//  if (keyPressed) {
//    if (key == 's'|| key == 'S') {
//      ballY += walkSpeed;
//    }
//  }
//  if (keyPressed) {
//    if (key == 'a' || key == 'A') {
//      ballX -= walkSpeed;
//    }
//  }
//  if (keyPressed) {
//    if (key == 'd'|| key == 'D') {
//      ballX += walkSpeed;
//    }
//  }
//}



//class Monster{
//  float x, y, d;
// void createMonster(){
//   x = random(width);
//   y = random(height);
//   d = 20;
// }
//void updateMonster() {
//  circle(x, y, d);
//}}
