/*
author(s): Jordy Wolf [500848484]
 purpose:   This script handles with all the powerups.
 */
PowerUpHandler powerupHandler = new PowerUpHandler();

class PowerUpHandler {
  int powerupID;
  float keyDistance;
  boolean startArrowTimer, startPotionTimer;
  boolean loadPowerupsOnce;
  int powerupAmount = 5;
  PImage[] powerupImages = new PImage[powerupAmount];
  Powerup[] powerups = new Powerup[powerupAmount];
  float d;
  boolean arrowTimer, potionTimer;
  int arrowTime, potionTime;

  void loadPowerups() {
    if (loadPowerupsOnce == false) {
      for (int i = 0; i < powerupAmount; i++) {
        powerups[i] = new Powerup();
        powerups[i].powerupID = i;
        powerups[i].powerupImage = powerupImages[i];

        int randomGetal = coinHandler.getRandomUnUsedTile();
        if (grid.grid.get(randomGetal).isUsed == true) { //zorg ervoor dat powerups niet op dezelfde plek komen te staan
          loadPowerups();
        } else {
          grid.grid.get(randomGetal).isUsed = true;
          powerups[i].powerupX = grid.grid.get(randomGetal).x * grid.w + grid.w/2;
          powerups[i].powerupY = grid.grid.get(randomGetal).y * grid.w + grid.w/2;
        }
      }
      loadPowerupsOnce = true;
    }
  }

  void updatePowerup() {
    for (int i = 0; i < powerups.length; i++) {
      player.drawObjectInView(powerups[i].powerupImage, powerups[i].powerupX, powerups[i].powerupY, powerups[i].powerupW, powerups[i].powerupH);
    }
  }

  void usePowerup() {
    if (powerupID == 1) {
      powerupPing();
    }
    if (powerupID == 2) {
      powerupRadar();
    }
    if (powerupID == 3) {
      powerupWhistle();
    }
    if (powerupID == 4) {
      powerupPotion();
    }
    if (powerupID == 5) {
      powerupArrow();
    }
    powerupID = 0;
  }


  void powerupPing() {
    for (int i = 0; i < pathFinding.length; i++) {
      pathFinding[i].showEnemy = true;
      pathFinding[i].startTime = frameCount;
    }
  }

  void powerupRadar() {

    grid.showWalls = true;
    grid.startTimer = frameCount;
  }

  void powerupWhistle() {
  }

  void powerupPotion() {
    potionTimer = true;
    potionTime= frameCount;
  }
  void powerupArrow() {
    Keys closestKey = null;
    arrowTimer = true;
    arrowTime = frameCount;
  }

  class Powerup {
    int powerupID;
    PImage powerupImage;
    float powerupX, powerupY, powerupW = grid.w / 3 - 10, powerupH =  grid.w / 3 - 10;
    int duration = 180;
  }
}
