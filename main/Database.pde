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
  int id;

  void start() {
    connection = new MySQLConnection("duivenn2", "cwLDxCm2ij$+50lh", "jdbc:mysql://oege.ie.hva.nl/zduivenn2?serverTimezone=UTC");
  }

  void callData() {
    highscoreTable = connection.getTable("Highscore");  
    highscoreTable = connection.runQuery("SELECT p.name, h.highscore FROM Highscore AS h INNER JOIN Player AS p ON h.idName = p .id ORDER BY highscore DESC LIMIT 10;");
  }

  void display() {
    background(0);
    fill(255);
    text("NAME", width * .5 - 150, 40);
    text("POINTS", width * .5 + 150, 40);
    for (int i = 0; i < highscoreTable.getRowCount(); i++) {
      TableRow row = highscoreTable.getRow(i);
      for (int j = 0; j < row.getColumnCount(); j++) {
        text(row.getString(j), width * .5 -150 + 300 * j, 80 + 40 * i);
      }
    }
    text("Press Z to exit", width * .5, height - 50);
    if (keysPressed['Z']) {
      menu.databaseShow = false;
    }
  }

  void addNameToDB(String name) {
    String insert = "INSERT INTO Player (name) VALUES ("+ "'" + name + "'" + ");";
    println(insert);
    connection.updateQuery(insert);
    id = connection.runQuery("SELECT id from Player ORDER BY id DESC;").getInt(0, 0);
  }

  void addToHighscore() {
    Table rs = connection.runQuery("SELECT highscore FROM Highscore WHERE idName = " + id + ";");
    if (rs.getRowCount() > 0) {
      //println("rc " + rs.getRowCount(), rs.getInt(0,0));
      int highscore = rs.getInt(0, 0);      
      if (score.newScore > highscore) {
        String update = "UPDATE Highscore AS h SET h.highscore = " + score.score + " WHERE idName = " + id + ";";
        println(update);
        connection.updateQuery(update);
      }
    } else {
      String insert = "INSERT INTO Highscore (idName, highscore) VALUES (" + "'" + id + "'" + ", " + score.score + ");";
      println(insert);
      connection.updateQuery(insert);
    }
    added = true;
  }

  void showHighscore() {
    String select = "SELECT * FROM Highscore;";
    println(select);
    connection.updateQuery(select);
  }

  void deleteFromHighscore() {
    String delete = "DELETE FROM Highscore WHERE idName = 1";
    println(delete);
    connection.updateQuery(delete);
  }

  void updateHighscore() {
    String update = "UPDATE Highscore AS h SET h.highscore = 100 WHERE idName = 1;";
    println(update);
    connection.updateQuery(update);
  }

  void showAnalytics() {
    String sql = "SELECT * from Analytics;";
    println(sql);
    connection.updateQuery(sql);
  }

  void insertAnalytics() {
    String sql = "INSERT INTO Analytics (idName, time, deaths) VALUES (1, 180, 4);";
    println(sql);
    connection.updateQuery(sql);
  }

  void showNameTimeDeathsanalytics() {
    String sql = "SELECT a.id, p.name, a.time, a.deaths FROM Analytics AS a INNER JOIN Player AS p ON a.idName = p.id;";
    println(sql);
    connection.updateQuery(sql);
  }

  void deleteAnalytics() {
    String sql = "DELETE FROM Analytics WHERE idName = 10;";
    println(sql);
    connection.updateQuery(sql);
  }

  void updateAnalytics() {
    String sql = "UPDATE Analytics AS a SET a.deaths = 150 WHERE idName = 1;";
    println(sql);
    connection.updateQuery(sql);
  }

  void showOddValuesAnalytics() {
    String sql = "SELECT a.id, p.name, a.time, a.deaths FROM Analytics AS a INNER JOIN Player AS p ON a.idName = p.id WHERE a.id > 5 AND a.id < 10 OR a.id = 13;";
    println(sql);
    connection.updateQuery(sql);
  }

  void showValuesFromAnalyticsNameWithT() {
    String sql = "SELECT a.id, p.name, a.time, a.deaths FROM Analytics AS a INNER JOIN Player AS p ON a.idName = p.id WHERE p.name LIKE 'T%';";
    println(sql);
    connection.updateQuery(sql);
  }

  void showCalculationAnalytics() {
    String sql = "SELECT p.name, a.deaths / a.time AS d_t FROM Analytics AS a INNER JOIN Player AS p ON a.idName = p.id;";
    println(sql);
    connection.updateQuery(sql);
  }

  void showSG() {
    String sql = "SELECT * from SaveGames;";
    println(sql);
    connection.updateQuery(sql);
  }

  void insertSG() {
    String sql = "INSERT INTO SaveGames (score, level, idName) VALUES (30, 2, 1); ";
    println(sql);
    connection.updateQuery(sql);
  }

  void showSGData() {
    String sql = "SELECT sg.id, sg.score, sg.level, p.name FROM SaveGames AS sg INNER JOIN Player AS p ON sg.idName = p.id;";
    println(sql);
    connection.updateQuery(sql);
  }

  void updateSG() {
    String sql = "UPDATE SaveGames AS sg SET sg.score = 69 WHERE idName = 1;";
    println(sql);
    connection.updateQuery(sql);
  }

  void deleteSG() {
    String sql = "DELETE FROM SaveGames AS sg WHERE sg.id = 4;";
    println(sql);
    connection.updateQuery(sql);
  }

  void showAchievs() {
    String sql = "SELECT * FROM Achievement;";
    println(sql);
    connection.updateQuery(sql);
  }

  void insertAchievs() {
    String sql = "INSERT INTO Player_has_Achievement VALUES (1,1);";
    println(sql);
    connection.updateQuery(sql);
  }

  void showAchievsPlayer() {
    String sql = "SELECT p.name, a.achievementName, a.achievementDesc, a.achievementImg FROM Player_has_Achievement AS pha INNER JOIN Player AS p ON pha.Player_id = p.id INNER JOIN Achievement AS a ON pha.Achievement_id = a.id;";
    println(sql);
    connection.updateQuery(sql);
  }

  void updateAchievDesc() {
    String sql = "UPDATE Achievement SET achievementDesc = 'dit is een nieuwe desc' WHERE achievement.id = 1;";
    println(sql);
    connection.updateQuery(sql);
  }
  void deleteAchievPlayer() {
    String sql = "DELETE FROM player_has_achievement WHERE Player_id = 1;";
    println(sql);
    connection.updateQuery(sql);
  }

  void showNames() {
    String sql = "SELECT name FROM Player;";
    println(sql);
    connection.updateQuery(sql);
  }

  void insertPlayer() {
    String sql = "INSERT INTO Player (name) VALUES ("+ "'" + "JAN" + "'"+ ");";
    println(sql);
    connection.updateQuery(sql);
  }

  void updatePlayer() {
    String sql = "UPDATE Player SET name = " + "'" + "Opa" + "'" + " WHERE id = 4";
    println(sql);
    connection.updateQuery(sql);
  }

  void deletePlayer() {
    String sql = "DELETE FROM Player WHERE id= 3";
    println(sql);
    connection.updateQuery(sql);
  }

  void sumHS() {
    String sql = "SELECT sum(h.highscore) AS totale_score FROM Highscore AS h;";
    println(sql);
    connection.updateQuery(sql);
  }

  void countAchievPlayer() {
    String sql = "SELECT COUNT(p.id) AS Aantal_spelers, a.achievementName FROM Player AS p INNER JOIN Player_has_Achievement AS pha ON p.id = pha.Player_id INNER JOIN Achievement AS a ON pha.Achievement_id = a.id GROUP BY a.achievementName;";
    println(sql);
    connection.updateQuery(sql);
  }

  void nameScoreAchiev() {
    String sql = "SELECT p.name, h.highscore, a.achievementName, a.achievementDesc FROM Player AS p INNER JOIN Player_has_Achievement AS pha ON p.id = pha.Player_id INNER JOIN Achievement AS a ON a.id = pha.Achievement_id INNER JOIN Highscore AS h ON p.id = h.idName;";
    println(sql);
    connection.updateQuery(sql);
  }
}
