//author = Tiara Vrossink, 500857262
//purpose = creating the gameover screen

GameOver gameOver = new GameOver();
//maak het gameover scherm aan
class GameOver {
  float textX, textY;
  void showGameOver() {
    textX = width/2;
    textY = height/2;
    background(0); 
    fill(255, 0, 0);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Gameover", textX, textY);
    player.speed = 0; //zorg ervoor dat de speler niet meer kan lopen zodat het spel niet meer gespeeld kan worden
  }
}
