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
  }

  void powerupWhistle() {
  }

  void powerupPotion() {
  }

  void powerupArrow() {
  }
}
