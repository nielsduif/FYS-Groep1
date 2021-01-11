/*
author(s): Jordy Wolf [500848484]
 purpose:   This script gives all the maze tiles their images, handles which tiles are in view and handles the exit gate. 
 */

TileSet tileSet = new TileSet();

//Tileset class om de tileset in te laden en alle tiles de juiste images te geven
class TileSet {
  int tileAmount = 17;
  int randomTile;
  int visionCap = 2;
  int capU, capR, capD, capL;
  boolean drawExit;
  boolean tileAccepted = false;
  boolean exitGateOpen = false;
  boolean idGiven = false;
  boolean playExitSoundOnce;
  PImage[] tileImages = new PImage[tileAmount];

  //Functie om een tile te drawen, geef het ID mee van de image en de X en Y positie
  void drawTile(int pTileID, int pTileImageID, float pPosX, float pPosY, int pTilePixelSize) {
    grid.grid.get(pTileID).isDrawn = true;
    image(tileImages[pTileImageID], pPosX, pPosY, pTilePixelSize, pTilePixelSize);
  }

  //Functie om de tiles door te geven die gedrawed moeten worden
  void updateMazeTiles() {
    background(0);
    for (int i = 0; i < grid.grid.size(); i++) {
      grid.grid.get(i).isDrawn = false;
    }
    drawExit = false;
    capU = capR = capD = capL = 0;
    for (int i = 0; i < grid.grid.size(); i++) {
      if (player.tileLocationX == grid.grid.get(i).x && player.tileLocationY == grid.grid.get(i).y) {
        drawTile(i, grid.grid.get(i).tileID, grid.grid.get(i).x * grid.grid.get(i).w, grid.grid.get(i).y * grid.grid.get(i).w, grid.grid.get(i).w);
        drawTilesInView(i, grid.grid.get(i).walls[0], grid.grid.get(i).walls[1], grid.grid.get(i).walls[2], grid.grid.get(i).walls[3]);
      }
      if (player.tileLocationX == grid.grid.get(randomTile).x && player.tileLocationY == grid.grid.get(randomTile).y) {
        drawExit = true;
      }
    }
    giveRandomTileExit();
    //drawVisionBlur();
  }

  //Functie die in elke richting gelooped word tot er een muur is en drawed dan de tiles in visie.
  void drawTilesInView(int pTileID, boolean pWallU, boolean pWallR, boolean pWallD, boolean pWallL) {
    if (pWallU == false && capU < visionCap) {
      capU++;
      int nextTile = pTileID - grid.cols;
      drawTile(nextTile, grid.grid.get(nextTile).tileID, grid.grid.get(nextTile).x * grid.grid.get(nextTile).w, grid.grid.get(nextTile).y * grid.grid.get(nextTile).w, grid.grid.get(nextTile).w);
      drawTilesInView(nextTile, grid.grid.get(nextTile).walls[0], true, true, true);
      if (grid.grid.get(nextTile).x == grid.grid.get(randomTile).x && grid.grid.get(nextTile).y == grid.grid.get(randomTile).y) {
        drawExit = true;
      }
    }
    if (pWallR == false && capR < visionCap) {
      capR++;
      int nextTile = pTileID + 1;
      drawTile(nextTile, grid.grid.get(nextTile).tileID, grid.grid.get(nextTile).x * grid.grid.get(nextTile).w, grid.grid.get(nextTile).y * grid.grid.get(nextTile).w, grid.grid.get(nextTile).w);
      drawTilesInView(nextTile, true, grid.grid.get(nextTile).walls[1], true, true);
      if (grid.grid.get(nextTile).x == grid.grid.get(randomTile).x && grid.grid.get(nextTile).y == grid.grid.get(randomTile).y) {
        drawExit = true;
      }
    }
    if (pWallD == false && capD < visionCap) {
      capD++;
      int nextTile = pTileID + grid.cols;
      drawTile(nextTile, grid.grid.get(nextTile).tileID, grid.grid.get(nextTile).x * grid.grid.get(nextTile).w, grid.grid.get(nextTile).y * grid.grid.get(nextTile).w, grid.grid.get(nextTile).w);
      drawTilesInView(nextTile, true, true, grid.grid.get(nextTile).walls[2], true);
    }
    if (pWallL == false && capL < visionCap) {
      capL++;
      int nextTile = pTileID - 1;
      drawTile(nextTile, grid.grid.get(nextTile).tileID, grid.grid.get(nextTile).x * grid.grid.get(nextTile).w, grid.grid.get(nextTile).y * grid.grid.get(nextTile).w, grid.grid.get(nextTile).w);
      drawTilesInView(nextTile, true, true, true, grid.grid.get(nextTile).walls[3]);
      if (grid.grid.get(nextTile).x == grid.grid.get(randomTile).x && grid.grid.get(nextTile).y == grid.grid.get(randomTile).y) {
        drawExit = true;
      }
    }
  }

  //Functie die bij elke tile checken waar de muren zitten en geeft het juiste ID aan de tile
  void giveCellsID() {
    if (idGiven == false) {
      for (int i=0; i < grid.grid.size(); i++) {
        if (grid.grid.get(i).walls[0] == true && grid.grid.get(i).walls[1] == false && grid.grid.get(i).walls[2] == true && grid.grid.get(i).walls[3] == false) {
          grid.grid.get(i).tileID = 0;
        } else if (grid.grid.get(i).walls[0] == false && grid.grid.get(i).walls[1] == true && grid.grid.get(i).walls[2] == false && grid.grid.get(i).walls[3] == true) {
          grid.grid.get(i).tileID = 1;
        } else if (grid.grid.get(i).walls[0] == true && grid.grid.get(i).walls[1] == false && grid.grid.get(i).walls[2] == false && grid.grid.get(i).walls[3] == true) {
          grid.grid.get(i).tileID = 2;
        } else if (grid.grid.get(i).walls[0] == true && grid.grid.get(i).walls[1] == true && grid.grid.get(i).walls[2] == false && grid.grid.get(i).walls[3] == false) {
          grid.grid.get(i).tileID = 3;
        } else if (grid.grid.get(i).walls[0] == false && grid.grid.get(i).walls[1] == true && grid.grid.get(i).walls[2] == true && grid.grid.get(i).walls[3] == false) {
          grid.grid.get(i).tileID = 4;
        } else if (grid.grid.get(i).walls[0] == false && grid.grid.get(i).walls[1] == false && grid.grid.get(i).walls[2] == true && grid.grid.get(i).walls[3] == true) {
          grid.grid.get(i).tileID = 5;
        } else if (grid.grid.get(i).walls[0] == true && grid.grid.get(i).walls[1] == false && grid.grid.get(i).walls[2] == false && grid.grid.get(i).walls[3] == false) {
          grid.grid.get(i).tileID = 6;
        } else if (grid.grid.get(i).walls[0] == false && grid.grid.get(i).walls[1] == true && grid.grid.get(i).walls[2] == false && grid.grid.get(i).walls[3] == false) {
          grid.grid.get(i).tileID = 7;
        } else if (grid.grid.get(i).walls[0] == false && grid.grid.get(i).walls[1] == false && grid.grid.get(i).walls[2] == true && grid.grid.get(i).walls[3] == false) {
          grid.grid.get(i).tileID = 8;
        } else if (grid.grid.get(i).walls[0] == false && grid.grid.get(i).walls[1] == false && grid.grid.get(i).walls[2] == false && grid.grid.get(i).walls[3] == true) {
          grid.grid.get(i).tileID = 9;
        } else if (grid.grid.get(i).walls[0] == false && grid.grid.get(i).walls[1] == false && grid.grid.get(i).walls[2] == false && grid.grid.get(i).walls[3] == false) {
          grid.grid.get(i).tileID = 10;
        } else if (grid.grid.get(i).walls[0] == true && grid.grid.get(i).walls[1] == true && grid.grid.get(i).walls[2] == false && grid.grid.get(i).walls[3] == true) {
          grid.grid.get(i).tileID = 11;
        } else if (grid.grid.get(i).walls[0] == true && grid.grid.get(i).walls[1] == true && grid.grid.get(i).walls[2] == true && grid.grid.get(i).walls[3] == false) {
          grid.grid.get(i).tileID = 12;
        } else if (grid.grid.get(i).walls[0] == false && grid.grid.get(i).walls[1] == true && grid.grid.get(i).walls[2] == true && grid.grid.get(i).walls[3] == true) {
          grid.grid.get(i).tileID = 13;
        } else if (grid.grid.get(i).walls[0] == true && grid.grid.get(i).walls[1] == false && grid.grid.get(i).walls[2] == true && grid.grid.get(i).walls[3] == true) {
          grid.grid.get(i).tileID = 14;
        } else {
          println("geen juiste tile gevonden");
        }
        idGiven = true;
      }
    }
  }

  //Functie om een willekeurige tile te kiezen en hem te checken of de exit gate daar valide kan staan, zo niet looped hij tot de tile geaccepteerd is.
  void giveRandomTileExit() {
    if (tileAccepted == false) {
      randomTile = int(random(grid.grid.size()));
      if (grid.grid.get(randomTile).walls[0] == true && grid.grid.get(randomTile).tileID != 2 && grid.grid.get(randomTile).tileID != 3 && grid.grid.get(randomTile).tileID != 11 && grid.grid.get(randomTile).tileID != 12) {
        tileAccepted = true;
        //println("exit: " + grid.grid.get(randomTile).x + "x " + grid.grid.get(randomTile).y + "y");
      } else giveRandomTileExit();
    }
  }

  //Functie die de exit gate drawed en checked of hij open of dicht is
  void updateExit() {
    if (drawExit == true) {
      if (tileAccepted == true) {  
        if (exitGateOpen == false) {
          tileSet.drawTile(randomTile, 15, grid.grid.get(randomTile).x * grid.grid.get(randomTile).w, grid.grid.get(randomTile).y * grid.grid.get(randomTile).w, grid.grid.get(randomTile).w);
        } else {
          tileSet.drawTile(randomTile, 16, grid.grid.get(randomTile).x * grid.grid.get(randomTile).w, grid.grid.get(randomTile).y * grid.grid.get(randomTile).w, grid.grid.get(randomTile).w);
          if (player.tileLocationX == grid.grid.get(randomTile).x && player.tileLocationY == grid.grid.get(randomTile).y) { // collision check for player into the exit gate
            textAlign(CENTER, CENTER);
            fill(255);
            textSize(30);
            text("Press S to enter the Exit Gate", width/2, height/2);
            if (keysPressed[83]) {
              escape();
            }
          }
        }
      }
    }
  }
  void escape() {
    levelSizer.rescaleLevel();
  }
}
