SoundFile ambience;
SoundFile exitOpen;
SoundFile monsterFootsteps;

void loadSound() {
  ambience = new SoundFile(this, "audio/ambience.wav");
  exitOpen = new SoundFile(this, "audio/exitopen.wav");
  monsterFootsteps = new SoundFile(this, "audio/monsterfootsteps.wav");
  ambience.play();
  ambience.loop();
}

void playSound(SoundFile pSound) {
  if (!pSound.isPlaying()) {
    pSound.play();
  }
}
