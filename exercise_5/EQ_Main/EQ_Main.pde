import ddf.minim.*;
import ddf.minim.analysis.*;
import java.lang.Thread;

//Variable Definitions
AudioPlayer song;
Minim minim;
Images images;
RandomLines txt;
float yStart = 550;
float yScale = 30;
FFT fft;

void setup() {
  minim = new Minim(this);
  song = minim.loadFile("Masterkraft_beardsagain.mp3");
  size(500, 750);
  background(0);
  textSize(14);
  fill(0,255,0);
  fft = new FFT(song.bufferSize(), song.sampleRate());
  text("Press P to Play", 10, 550);
  
  
  images = new Images();
  txt = new RandomLines();
  
  //Display Text Beards with RandomLines
  txt.start();
}

void draw() {

  if (song.isPlaying()) {
    noStroke();
    fill(0);
    rect(0, 500, 500, 300);
   
    fill(0,255,0);
    textSize(14);
    text("EQ", 10, 600); 
    text("Amplitude", 10, 513); 

    // Auslesen der Amplitudenwerte 
    for (int i = 0; i < song.bufferSize () - 1; i++) {
      stroke(0, 255, 0);
      line(i, yStart + song.mix.get(i)*yScale, i+1, yStart + song.mix.get(i+1)*yScale);
    } 

    // perform a forward FFT on the samples in sounds's buffer
    fft.forward(song.mix);
    for (int i = 0; i < fft.specSize (); i++) {
      // draw the line for frequency band i
      line(i, 750, i, 750 - fft.getBand(i));
    }
  }
}

void keyPressed() {
  if ( key == 'p' ) {
    //stop the lines
    txt.stopp();
    
    // play the file
    song.play();
    song.rewind();

    //Display Beard Image
    images.start();
    
  } else if ( key == 's') {
    song.pause();
    images.interrupt();
  }
}

