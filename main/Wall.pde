class Wall {
  float wallX;
  float wallY; 
  void createWall() {
    wallX = random(0, width);
    wallY = random(0, height);
  }
  void updateWall() {
    rect(wallX, wallY, wallW, wallH);
  }
}
