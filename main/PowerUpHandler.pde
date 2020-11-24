/*
author(s): Jordy Wolf [500848484]
 purpose:   This script handles with all the powerups.
 */
PowerUpHandler powerUpHandler = new PowerUpHandler();

class PowerUpHandler {
  int powerupID;
  float d;
  boolean arrowTimer, potionTimer;
  int arrowTime, potionTime;

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
}
