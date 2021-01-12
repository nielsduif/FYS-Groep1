/*
author: Niels Duivenvoorden[500847100]
 purpose:   class die het gehele grid maakt, oftewel het daadwerkelijke speelveld
 bevat ook een functie die kijkt naar de omliggende cellen, om te kijken waar het willekeurige pad 'naartoe' kan voortbewegen
 */

//het grid object aanmaken
Grid grid = new Grid();

class Grid {
  int cols, rows; //aantal colommen en rijen
  int w; //breedte van 1 grid cell
  int deletedWallsCount = 10; //aantal willekeurige muren dat verwijdert zal worden
  boolean deletedWalls;
  boolean showWalls = false;
  int powerUpFrames = 180, startTimer;

  //aanmaken van een lijst met alle cellen erin
  ArrayList<Cell> grid = new ArrayList<Cell>();

  //huidige cell bijhouden
  Cell current;

  //lijst om de maze af te maken zodra deze vast zou lopen
  ArrayList<Cell> stack = new ArrayList<Cell>();

  //bijhouden of het doolhof klaar is met genereren
  boolean doneGenerating;

  //functie om de lijst die de cellen bevat te vullen, en het aantal rijen en colommen berekent
  void start() {
    deletedWalls = false;
    doneGenerating = false; 
    cols = floor(width/w); //aantal cellen op de x-as
    rows = floor(height/w); //aantal cellen op de y-as

    //println(cols + " x " + rows + " = " + cols * rows + " cells"); //debug voor spelveld grootte

    //vullen van de lijst met alle cellen
    for (int y=0; y < rows; y++) {
      for (int x=0; x < cols; x++) {
        Cell cell = new Cell(x, y, w); //nieuwe cell aamaken op de desbetreffende x en y as, e.g. cell[0] = Cell(0, 0, 100)
        grid.add(cell); //gemaakte cell toevoegen aan de lijst
      }
    }
    current = grid.get(0); //huidige cell is waar het doolhof begint, oftewel positie (0,0)
  }

  void update() {  
    //start algoritme
    current.visited = true; 

    //krijg alle buurcellen door en maak hiervoor een nieuwe cell aan
    Cell next = current.checkNeighbors();

    if (next != null) { //check of er een volgende is
      next.visited = true; //bezocht doorgeven

      stack.add(current); //stack lijst bijwerken

      removeWalls(current, next); //muren tussen huidige cell en de volgende verwijderen

      current = next; //huidige cell daadverkelijk verplaatsen
    } else if (stack.size() > 0) { //terugwerken zodra current is ingebouwd via de bekende route tot waar er nog onbezochte cellen zijn
      current = stack.remove(stack.size()-1); //daadwerkelijk verwijderen van bezochten cellen
      current.highlight(); //kleur geven tijdens generaten
      doneGenerating = false;
    } else {
      doneGenerating = true; //stack is leeg, dus het doolhof is klaar met genereren
      if (deletedWalls == false) { //check of er al willekeurige muren verwijdert zijn
        for (int i = deletedWallsCount; i > 0; ) {
          int randomTileY = int(random(grid.size() - cols));
          if (grid.get(randomTileY).walls[2] == true) {
            removeWalls(grid.get(randomTileY), grid.get(randomTileY + cols));
            i++;
          } else {
            i--;
          }
        }
        deletedWalls = true;
      }
      tileSet.giveCellsID();
      tileSet.updateMazeTiles();
    }

    //tekenen van alle cellen in de lijst
    if (showWalls) {
      for (int i=0; i < grid.size(); i++) {
        grid.get(i).show();
      }
      if (frameCount > startTimer + powerUpFrames) {
        showWalls = false;
        startTimer = 0;
      }
    }
  }

  //functie om de cell boven, rechts, onder of links van huidige te pakken
  int index(int x, int y) {
    if (x < 0 || y < 0 || x > cols-1 || y > rows-1) { //check of het zich in het speelveld bevindt
      return 0;
    }
    return x + y * cols;
  }

  //functie om muren te verwijderen
  void removeWalls(Cell a, Cell b) { //muren tussen de meegegeven cellen worden verwijderd
    int x = a.x - b.x; //bepaling of het om de linker of rechter kant van de cellen gaat
    if (x == 1) { //rechts
      a.walls[3]=false; //daadwerkelijk uit zetten van de muren van het cell object
      b.walls[1]=false;
    } else if (x == -1) { //links
      a.walls[1]=false;
      b.walls[3]=false;
    }
    int y = a.y - b.y; //bepaling boven of onder
    if (y == 1) { //boven
      a.walls[0] = false;
      b.walls[2] = false;
    } else if (y == -1) { //onder
      a.walls[2] = false;
      b.walls[0] = false;
    }
  }
}
