/*
 * Klasse für die Bartbilder
 *
 *
 */

public class Images extends Thread {

  //Variable Definition
  PImage[] img;

  // Konstruktor
  Images() {
    img = new PImage[55];
    loadImages();
  }

  // Run Methode für Thread
  public void run() {
    while (true) {
      displayImage();  
    }
  }
  
  private void displayImage(){
    PImage image = img[int (random(0,55))];
    
    // Random delay
    //delay(int (random(100, 1000)));
    
    // one per beat
    //delay(920);
    
    //two per beat
    delay(460);
    image(image,0,0);
  }

  // Methode um Bilder in Array zu laden
  public void loadImages() {
    for (int i=0; i<img.length; i++) {
      img[i] = loadImage("beard0"+i+".jpg");
      println("loaded Image beard0"+i);
    }
  }
}

