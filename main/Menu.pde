/*
author: Niels Duivenvoorden[500847100]
 purpose:   menu ui om het spel te starten, kan naar verschillende paginas voordat het spel echt begint
 */

Menu menu = new Menu();

class MenuTab {
  float x, y, w = 300, h=50;
  String itemTitle;
  boolean selected;

  void draw() {
    if (!selected) {
      fill(255);
    } else {
      fill(255, 0, 0);
      circle(x + w + h, y + h * .5, h);
      textAlign(CENTER, CENTER);
      fill(0);
      text("A", x + w + h, y + h * .5);
      fill(250, 175, 50);
    }
    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER, CENTER);
    text(itemTitle, x + w * .5, y + h * .5);
  }
}

class Menu {
  String title;
  float titleX, titleY;
  int tabAmount = 4;
  MenuTab[] mt = new MenuTab[tabAmount];
  String[] tabTitles = {"Play", "Highscores","Story", "Exit"};
  int tabSpacing = 75;
  int selected = 0;
  boolean start, databaseShow, name, selectOnce;

  void start() {
    titleX = width * .5;
    titleY = height * .3;
    title = "Maze Escape";
    for (int i = 0; i < mt.length; i++) {
      mt[i] = new MenuTab();
      mt[i].itemTitle = tabTitles[i];
      mt[i].x = width * .5 - mt[i].w * .5;
      mt[i].y = height * .5 + i * tabSpacing - mt[i].h * .5;
    }
    scroller.start();
    database.start();
  }
  void display() {
    background(0);
    if (!start) {
      if (databaseShow) {
        database.display();
      } else {
        textAlign(CENTER);
        fill(255);
        text(title, titleX, titleY);
        for (int i = 0; i < mt.length; i++) {
          mt[i].draw();
        }    
        for (int i = 0; i < mt.length; i++) {
          if (i==selected) {
            mt[selected].selected = true;
          } else {
            mt[i].selected=false;
          }
        }
        if (keysPressed['A'] && selected == 0  && !selectOnce) {
          if (!name) {
            start = true;
          }
          selectOnce = true;
        } else if (keysPressed['A'] && selected == 1) {
          selectOnce = true;
          database.callData();
          databaseShow = true;
        } else if (keysPressed['A'] && selected == 2) {
          exit();
        }
        if (keysPressed[DOWN] && !selectOnce) {
          if (menu.selected + 1 < menu.tabAmount) {
            menu.selected++;
          }
          selectOnce = true;
        }  
        if (keysPressed[UP] && !selectOnce) {
          if (menu.selected - 1 >= 0) {
            menu.selected--;
          }
          selectOnce = true;
        }
      }
    } 
    if (!keysPressed[UP] && !keysPressed[DOWN] && !keysPressed['A']) {
      selectOnce = false;
    }
  }
}
