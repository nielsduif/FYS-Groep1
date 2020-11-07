/*
author: Niels Duivenvoorden[500847100]
purpose:   class voor alle individuele vakjes op het scerm
           bevat ook een functie die kijkt naar de omliggende cellen, om te kijken waar het willekeurige pad 'naartoe' kan voortbewegen
*/

class Cell {
  int tileID;

  int x, y, w; //x = waarde op x-as, y = waarde op y-as, w = breedte en hoogte
  boolean[] walls = {true, true, true, true}; //waarde van alle muren, van 0 tm 3 = boven, rechts, onder, links
  boolean visited = false; //waarde of de cell al 'bezocht' is door het random algoritme
  boolean isDrawn; 

  //plaatsing zodra cell wordt aangeroepen dmv parameters
  Cell(int _x, int _y, int _w) {
    x = _x;
    y = _y;
    w = _w;
  }

  //functie om het pad te bepalden dmv omgliggende cellen en een random functie
  Cell checkNeighbors() {
    ArrayList<Cell> neighbors = new ArrayList<Cell>(); //lijst waarin de omliggende cellen in worden gevoerd

    Cell top    = grid.grid.get(grid.index(x, y-1)); //cell die boven huidige cell ligt
    Cell right  = grid.grid.get(grid.index(x+1, y)); //cell die rechts van huidige cell ligt
    Cell bottom = grid.grid.get(grid.index(x, y+1)); //cell die onder huidige cell ligt
    Cell left   = grid.grid.get(grid.index(x-1, y)); //cell die links van huidige cell ligt

    if (top != null && !top.visited) { //als er een cell boven de huidige cell is en die cell is nog niet bezocht
      neighbors.add(top); //voeg de cel boven de huidge daadwerkelijk toe aan de lijst, aangezien dit een optie is om de route voort te zetten
    }
    if (right != null && !right.visited) {
      neighbors.add(right);
    }
    if (bottom != null && !bottom.visited) {
      neighbors.add(bottom);
    }
    if (left != null && !left.visited) {
      neighbors.add(left);
    }

    if (neighbors.size() > 0) { //kijk of er uberhaupt onbezochte buurcellen zijn
      int r = floor(random(0, neighbors.size())); 
      return neighbors.get(r); //zo ja, pak een willekeurige uit de opties
    } else {
      return null; 
    }
  }

  //functie om de huidge drawing cell een kleur mee te geven
  void highlight() {
    noStroke();
    fill(255);
    rect(x * w, y * w, w, w);
  }

  //teken de cellen
  void show() {
    int xL = x * w; 
    int yL = y * w;
    stroke(255);
    if (walls[0]) {    
      line(xL, yL, xL + w, yL);         //top
    }
    if (walls[1]) {    
      line(xL + w, yL, xL + w, yL + w); //right
    }
    if (walls[2]) {    
      line(xL, yL + w, xL + w, yL +w);  //bottom
    }
    if (walls[3]) {    
      line(xL, yL, xL, yL + w);         //left
    }

    if (visited) {
      noStroke();
      fill(0, 0, 0, 50);
      rect(xL, yL, w, w);
    }
  }
}
