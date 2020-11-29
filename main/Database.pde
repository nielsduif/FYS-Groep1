/*
author: Niels Duivenvoorden[500847100]
 purpose:   connectie met databse om highscores te pushen
 */

import samuelal.squelized.*;

class Database {
  SQLConnection connection;
  int ID;
  String name;

  void start() {
    connection = new MySQLConnection("root", "100%Koffie", "oege.ie.hva.nl/zduivenn2?serverTimezone=UTC");
    ID = connection.runQuery("SELECT * from highscore;").getInt(0, 0);
    randomName();
  }

  void insertScore(String name) {
    String update = "INSERT INTO highscore name, highscore VALUES (" + "'" + name + "'" + ", " + score.score + ");";
    connection.updateQuery(update);
  }

  void randomName() {
    int length = int(random(3, 10));
    String[] letters = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "o"};
    name="";
    for (int i = 0; i < length; i++) {
      name += letters[int(random(0, length))];
    }
  }
}
