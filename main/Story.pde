/*
author(s): Niels Duivenvoorden [500847100], Andrew Silos
 purpose:   show a version of the story like a typewriter
 */

Story story= new Story();

class Story
{
  String text1 = "A couple who travels the world over, to see the wonders that it has to offer find themselves in a castle in a remote spot of the countryside. While exploring the castle, the couple gets separated because of the poor condition the castle was left in. The husband fell down in to the depths of the castle. Without proper lighting the husband can’t see further then 6 ft around him. He soon figures out that he finds himself in an underground maze and needs to get back up to his wife. But in the shadows, he hears noises, a chill down his spine informs him that he is not alone in the maze.";
  float counter;

  void typewriteText() {
    playSound(typeWriter);
    background(0);
    fill(255);
    if (counter < text1.length()) {
      counter+=.3;
    } else {      
      typeWriter.stop();
    }
    textAlign(LEFT);
    textSize(20);
    text(text1.substring(0, round(counter)), width * .2, height * .3, width * .6, height);

    textSize(25);
    textAlign(CENTER, CENTER);
    text("Press Z to exit", width * .5, height - height * .1);

    if (keysPressed['Z']) {
      menu.storyShow = false;
      typeWriter.stop();
    }

    if (counter < text1.length()) {
      text("Press S to skip", width * .5, height - height * .15);
      if (keysPressed['S']) {
        counter = text1.length();
        typeWriter.stop();
      }
    }
  }
}
