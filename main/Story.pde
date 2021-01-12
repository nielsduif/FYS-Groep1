class Story
{
  String text1 = "A couple who travels the world over, to see the wonders that it has to offer find themselves in a castle in a remote spot of the countryside. While exploring the castle, the couple gets separated because of the poor condition the castle was left in. The husband fell down in to the depths of the castle. Without proper lighting the husband can’t see further then 6 ft around him. He soon figures out that he finds himself in an underground maze and needs to get back up to his wife. But in the shadows, he hears noises, a chill down his spine informs him that he is not alone in the maze.";
  int counter;

  void typewriteText() {
    fill(255);
    if (counter < text1.length()) {
      counter++;
    }
    textAlign(CENTER, CENTER);
    text(text1.substring(0, counter), 30, 0, width, height);
  }
}
