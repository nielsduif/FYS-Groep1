Warning warning = new Warning();
class Warning {
  float timer = 180;
  boolean warningScreen = true;
  void showWarning() {
    background(0);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("A very small percentage of people may experience a seizure when exposed to certain visual images, including flashing lights or patterns that may appear in video games. Even people who have no history of seizures or epilepsy may have an undiagnosed condition that can cause these “photosensitive epileptic seizures” while playing video games. Immediately stop playing and consult a doctor if you experience any symptoms.", 
      0, 
      0, 
      width, 
      height);
    textAlign(CENTER, CENTER);
    if (frameCount > timer) {
      warningScreen = false;
    }
  }
}
