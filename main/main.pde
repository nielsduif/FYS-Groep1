// global variables
Player player;
void setup()
{
  size(500, 500);
  player= new Player();
}

void draw()
{
  background(0);
  player.update();
}
