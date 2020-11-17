/*
author(s): Jordy Wolf [500848484], Tiara Vrossink [500857262]
purpose:   This script handles with all the powerups.
*/

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

//Tiara
  void powerupPotion() {
    player.speed = player.speed * 2;
  }

  void powerupArrow() {
    
  }
}
