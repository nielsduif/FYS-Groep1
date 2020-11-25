SoundFile ambience;

public void loadSound() {
  ambience = new SoundFile(this, "ambience.wav");
  ambience.play();
  ambience.loop();
}
