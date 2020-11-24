/*
author(s): Jordy Wolf [500848484]
 purpose:   This script handles with all the powerups.
 */
PowerUpHandler powerUpHandler = new PowerUpHandler();

class PowerUpHandler {
  int powerupID;
  int powerupAmount = 5;
  PImage[] powerupImages = new PImage[powerupAmount];
  Powerup[] powerups = new Powerup[powerupAmount];
  float d;
  boolean arrowTimer, potionTimer;
  int arrowTime, potionTime;


  void loadPowerups() {
    for (int i = 0; i > powerupAmount; i++) {
      powerups[i] = new Powerup();
      powerups[i].powerupID = i;
      powerups[i].powerupImage = powerupImages[i];
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
      float powerupX, powerupY, powerupW = 16, powerupH = 16;
      int duration = 180;
    }
  }
