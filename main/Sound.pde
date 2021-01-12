SoundFile ambience;
SoundFile exitOpen;
SoundFile monsterFootsteps;
SoundFile coinPickup;
SoundFile keyPickup;
SoundFile powerupPickup;
SoundFile radar;
SoundFile potion;
SoundFile xray;
SoundFile whistle;
SoundFile light;
SoundFile jumpscare;
SoundFile click;
SoundFile typeWriter;

void loadSound() {
  ambience = new SoundFile(this, "audio/ambience.wav");
  exitOpen = new SoundFile(this, "audio/exitopen.wav");
  monsterFootsteps = new SoundFile(this, "audio/monsterfootsteps.wav");
  coinPickup = new SoundFile(this, "audio/coin.wav");
  keyPickup = new SoundFile(this, "audio/key.wav");
  powerupPickup = new SoundFile(this, "audio/poweruppickup.wav");
  radar = new SoundFile(this, "audio/radar.wav");
  potion = new SoundFile(this, "audio/potion.wav");
  xray = new SoundFile(this, "audio/xray.wav");
  whistle = new SoundFile(this, "audio/whistle.wav");
  light = new SoundFile(this, "audio/light.wav");
  jumpscare = new SoundFile(this, "audio/jumpscare.wav");
  click = new SoundFile(this, "audio/menuclick.wav");
  typeWriter = new SoundFile(this, "audio/typewriter.wav");

  ambience.play();
  ambience.loop();
}

void playSound(SoundFile pSound) {
  if (!pSound.isPlaying()) {
    pSound.play();
  }
}
