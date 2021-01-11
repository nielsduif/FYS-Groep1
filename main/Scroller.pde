/*
author: Niels Duivenvoorden[500847100]
 purpose:   manier van invoeren van een naam voor de gebruiker zonder toetsenbord, geldig voor 3 letters (afkorting naam)
 */

Scroller scroller = new Scroller();

class LetterScroller {
  float x, y;
  int textSize = 20, textSizeSelected = 30;
  int[] textColor = {255, 255, 255}, textColorSelected = {200, 200, 0}, textColorSide = {100, 100, 100, 75};
  String letters = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z";
  String[] allLetters;
  int selectedLetter;
  boolean selected;
  float spacing = 30;

  LetterScroller( float ix, float iy) {
    x = ix;
    y = iy;
  }

  void start() {
    allLetters = split(letters, ',');
    selectedLetter = 0;
  }

  void display() {
    if (selected) {
      textSize(textSizeSelected);
      fill(textColorSelected[0], textColorSelected[1], textColorSelected[2]);
    } else {
      textSize(textSize);
      fill(textColor[0], textColor[1], textColor[2]);
    }
    textAlign(CENTER, CENTER);
    text(allLetters[selectedLetter], x, y);
    fill(textColorSide[0], textColorSide[1], textColorSide[2], textColorSide[3]);
    if (selectedLetter - 1 >= 0) {
      text(allLetters[selectedLetter - 1], x, y - spacing);
    }
    if (selectedLetter + 1 < allLetters.length) {
      text(allLetters[selectedLetter + 1], x, y + spacing);
    }
  }

  void Up() {
    if (selectedLetter + 1 < allLetters.length) {
      selectedLetter++;
    }
  }

  void Down() {
    if (selectedLetter - 1 >= 0) {
      selectedLetter--;
    }
  }
}

class Scroller {
  float x, y;
  int letterScrollerAmount = 3;
  float spacing;
  LetterScroller[] ls = new LetterScroller[letterScrollerAmount];
  int selectedScroller;
  String name;
  float[] nameColor = {255};
  boolean selectOnce;

  void start() {
    x = width * .5;
    y = height * .5;
    spacing = width / letterScrollerAmount;
    for (int i = 0; i < ls.length; i++) {
      ls[i] = new LetterScroller((x - spacing) + (spacing * i), y);
      ls[i].start();
    }
    selectedScroller = 0;
  }

  void display() {
    background(0);

    if (keysPressed[RIGHT] && scroller.selectedScroller + 1 < scroller.ls.length && !selectOnce) {
      scroller.selectedScroller++;
      selectOnce = true;
    } 
    if (keysPressed[LEFT] && scroller.selectedScroller - 1 >= 0 && !selectOnce) {
      scroller.selectedScroller--;
      selectOnce = true;
    }
    if (keysPressed[UP] && !selectOnce) {
      scroller.ls[scroller.selectedScroller].Up();
      selectOnce = true;
    }
    if (keysPressed[DOWN] && !selectOnce) {
      scroller.ls[scroller.selectedScroller].Down();
      selectOnce = true;
    }
    if (!keysPressed[DOWN] && !keysPressed[UP] && !keysPressed[LEFT] && !keysPressed[RIGHT]) {
      selectOnce = false;
    }
    if (keysPressed['A'] && !menu.selectOnce) {
      println("username: " + name);
      database.addNameToDB(name);
      menu.name = true;
      levelSizer.generateStart();
    }

    ls[selectedScroller].selected = true;
    for (int i = 0; i < ls.length; i++) {
      if (i != selectedScroller) {
        ls[i].selected = false;
      }
      ls[i].display();
    }
    buildString();
    textSize(50);
    fill(nameColor[0]);
    text("name: " + name, x, height - height * .1);
    textSize(30);
    text("Druk A om te bevestigen", x, height - height * .05);
  }

  void buildString() {
    name = "";
    for (int i = 0; i < ls.length; i++) {
      name += ls[i].allLetters[ls[i].selectedLetter];
    }
  }
}
