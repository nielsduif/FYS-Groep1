/*
author: Niels Duivenvoorden[500847100]
 purpose:   connectie met databse om highscores te pushen
 */

import samuelal.squelized.*;

Database database = new Database();

class Database {
  Table highscoreTable;
  SQLConnection connection;
  boolean added;

  void start() {
    connection = new MySQLConnection("duivenn2", "cwLDxCm2ij$+50lh", "jdbc:mysql://oege.ie.hva.nl/zduivenn2?serverTimezone=UTC");
  }

  void display() {
    background(0);
    textSize(15);

    highscoreTable = connection.getTable("Highscore");  
    highscoreTable = connection.runQuery("SELECT * FROM Highscore ORDER BY highscore DESC LIMIT 10");

    fill(255);

    text("ID", width * .5 - 150, 20);
    text("NAME", width * .5, 20);
    text("POINTS", width * .5 + 150, 20);
    for (int i = 0; i < highscoreTable.getRowCount(); i++) {
      TableRow row = highscoreTable.getRow(i);
      for (int j = 0; j < row.getColumnCount(); j++) {
        text(row.getString(j), width * .5 - 150 + 150 * j, 60 + 20 * i);
      }
    }
    text("Druk A om terug te gaan", width * .5, height - 50);
    if (keysPressed['A'] && !menu.selectOnce) {
      println("back");
      menu.databaseShow = false;
    }
  }

  void addToDB() {
    String[] cols = {"name", "highscore"};
    String update = "INSERT INTO Highscore (" + cols[0] + ", " + cols[1] + ") VALUES (" + "'" + scroller.name + "'" + ", " + score.score + ");";
    println(update);
    connection.updateQuery(update);
    added = true;
  }
}
