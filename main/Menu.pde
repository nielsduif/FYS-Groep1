class MenuTab {
  float x, y, w = 300, h=50;
  String itemTitle;
  boolean selected;

  void draw() {
    if (!selected) {
      fill(255);
    } else {
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
  String[] tabTitles = {"Play", "Settings", "Highscores", "Exit"};
  int tabSpacing = 75;
  int selected = 0;
  boolean chosen;

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
  }
  void display() {
    if (!chosen) {
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
      if (keyCode == 'A' && selected == 0) {
        chosen = true;
        levelSizer.generateStart();
      }
    }
  }
}
