/**
 * World Animation.
 * MMF exercise 4
 * 
 * some simple piece of code to animate an earth ball
 * @author Ralph Kyburz 
 */

PImage img;  // Declare variable "a" of type PImage
Animation animation;
float xpos;
float ypos;
int direction;

void setup() {
  size(700, 300, P3D); //define sketchbook size
  background(0);
  xpos=330;
  ypos=125;
  showElements();
  direction=1;

  animation = new Animation("IMG", 18);
}

void draw() {
  animateEarth(direction);
}

// dir 1 = forward / direction -1 = backward
void animateEarth(int dir){
  if (dir == 1){
    animation.displayforwards(xpos, ypos);
  }
  
  else{
   animation.displaybackwards(xpos,ypos);
  } 
}

void showElements() {
  stars();
  moon();
}


void stars() {
  for (int i=0; i<400; i+=1) {
    point(random(5, 695), random(5, 295));
    stroke(255);
  }
}

void moon() {
  noStroke(); 
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  directionalLight(100, 100, 100, -dirX, -dirY, -1);  
  translate(width/2 + 75, height/2 - 20, 0);
  sphere(15);
}

void mousePressed() { 
  direction = direction*(-1);
}

void keyPressed() { 
  if (key == 'p') {
    saveFrame(); // aktuelles Bild speichern
  }
}




// Class for animating a sequence of GIFs



class Animation {

  PImage[] images;

  int imageCount;

  int frame;



  Animation(String imagePrefix, int count) {

    imageCount = count;

    images = new PImage[imageCount];



    for (int i = 0; i < imageCount; i++) {

      // Use nf() to number format 'i' into four digits

      String filename = imagePrefix + nf(i+1, 4) + ".GIF";

      images[i] = loadImage(filename);
    }
  }



  void display(float xpos, float ypos) {

    frame = (frame+1) % imageCount;
    println(frame);
    image(images[frame], xpos, ypos);

    delay(100);
  }
  
  void displayforwards(float xpos, float ypos) {
  frame++;
  if (frame == 18){
    frame = 0;
  }
  println(frame);
  image(images[frame], xpos, ypos);

  delay(100);
}
  
  
  void displaybackwards(float xpos, float ypos) {
    
    frame--;
    if (frame == -1){
      frame = 17;
    }
    println(frame);
    image(images[frame], xpos, ypos);
    
    delay(100);
    
  }


  void delay(int delay) {
    
    int time = millis();
    
    while (millis () - time <= delay);
  }
}

