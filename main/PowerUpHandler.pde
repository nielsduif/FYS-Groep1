/*
author(s): Jordy Wolf [500848484]
 purpose:   This script handles with all the powerups.
 */
PowerUpHandler powerUpHandler = new PowerUpHandler();

class PowerUpHandler {
  int powerupID;

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
  }

  void powerupRadar() {
    grid.showWalls = true;
    grid.startTimer = frameCount;
  }

  void powerupWhistle() {
  }

  void powerupPotion() {
  }

  void powerupArrow() {
  }
}
