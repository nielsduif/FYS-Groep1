/*
author(s): Jordy Wolf [500848484]
 purpose:   This script handles with all the powerups.
 */
PowerUpHandler powerupHandler = new PowerUpHandler();

class PowerUpHandler {
  int currentPowerup;
  float keyDistance;
  boolean loadPowerupsOnce;
  boolean startArrowTimer, startPotionTimer, startWhistleTimer;
  int powerupAmount = 6;
  PImage[] powerupImages = new PImage[powerupAmount];
  Powerup[] powerups = new Powerup[powerupAmount];
  int arrowTime, potionTime, whistleTime;

  int visibleTime = 180;
  float degrees;
  boolean showTimeIcon;

  void loadPowerups() {
    if (loadPowerupsOnce == false) {
      for (int i = 0; i < powerupAmount; i++) {
        powerups[i] = new Powerup();
        powerups[i].pickedUp = false;
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
      powerups[0].powerupName = "Empty";
      powerups[1].powerupName = "Ping";
      powerups[2].powerupName = "Radar";
      powerups[3].powerupName = "Whistle";
      powerups[4].powerupName = "Potion";
      powerups[5].powerupName = "Xray";

      loadPowerupsOnce = true;
    }
  }

  void updatePowerup() {
    for (int i = 1; i < powerups.length; i++) { //forloop starts with 1 because 0 is an empty powerup and does not need to be updated
      if (powerups[i] != null && powerups[i].pickedUp == false) {
        player.drawObjectInView(powerups[i].powerupImage, powerups[i].powerupX, powerups[i].powerupY, powerups[i].powerupW, powerups[i].powerupH);
        float afstandX = abs(powerups[i].powerupX - player.x);
        float afstandY = abs(powerups[i].powerupY - player.y);
        if (afstandX <= powerups[i].powerupW/2 + player.playerW/2 && afstandY <= powerups[i].powerupW/2 + player.playerW) { //check of speler over de powerup heen loopt
          textAlign(CORNER, CORNER);
          fill(255);
          textSize(30);
          text("Press S to pick up", 10, 60);
          if (keysPressed[83]) {
            currentPowerup = i;
            powerups[i].pickedUp = true;
            playSound(powerupPickup);
          }
        }
      }
    }
    if (keysPressed['X']) {
      usePowerup();
    }
    //niels :D
    if (showTimeIcon) {
      showTimer();
      if (degrees < visibleTime * 2) {
        degrees += 2;
      } else {
        degrees = 0;
        showTimeIcon = false;
      }
    }
  }

  void usePowerup() {
    if (currentPowerup == 1) {
      showTimeIcon = true;
      visibleTime = 180;
      degrees = 0;
      powerupPing();
    }
    if (currentPowerup == 2) {
      showTimeIcon = true;
      visibleTime = 180;
      degrees = 0;
      powerupRadar();
    }
    if (currentPowerup == 3) {
      showTimeIcon = true;
      visibleTime = 180;
      degrees = 0;
      powerupWhistle();
    }
    if (currentPowerup == 4) {
      showTimeIcon = true;
      visibleTime = 180;
      degrees = 0;
      powerupPotion();
    }
    if (currentPowerup == 5) {
      showTimeIcon = true;
      visibleTime = 180;
      degrees = 0;
      powerupArrow();
    }
    currentPowerup = 0;
  }

  //niels :D
  void showTimer() {
    fill(255, 90);
    float rad = radians(degrees);
    arc(width - 110 + 50, height - 110 + 50, 100, 100, 0, rad, PIE);
    fill(255);
    textAlign(CENTER, CENTER);
    text(round(4 - (rad) * .5), width - 110 + 50, height - 110 + 50);
  }

  void powerupUI() {
    if (currentPowerup != 0) {
      int powerupUiX = width - 110;
      int powerupUiY = height - 110;
      int powerupUiAlpha;

      if (player.x > powerupUiX && player.y > powerupUiY) {
        powerupUiAlpha = 100;
      } else {        
        powerupUiAlpha = 255;
      }
      tint(255, powerupUiAlpha);
      image(powerups[currentPowerup].powerupImage, powerupUiX, powerupUiY, 100, 100);
      tint(255, 255);
    }
  }

  void powerupPing() {
    for (int i = 0; i < pathFinding.length; i++) {
      pathFinding[i].showEnemy = true;
      pathFinding[i].startTime = frameCount;
      playSound(radar);
    }
  }

  void powerupRadar() {
    grid.showWalls = true;
    grid.startTimer = frameCount;
    playSound(light);
  }

  void powerupWhistle() {
    startWhistleTimer = true;
    whistleTime = frameCount;
    monsterFootsteps.stop();
    playSound(whistle);
  }

  void powerupPotion() {
    startPotionTimer = true;
    potionTime= frameCount;
    playSound(potion);
  }

  void powerupArrow() {
    startArrowTimer = true;
    arrowTime = frameCount;
    playSound(xray);
  }

  class Powerup {
    int powerupID;
    boolean pickedUp;
    String powerupName;
    PImage powerupImage;
    float powerupX, powerupY, powerupW = grid.w / 3 - 10, powerupH =  grid.w / 3 - 10;
    int duration = 180;
  }
}
