public class RandomLines extends Thread{
 /*
 * Random lines.
 *
 * @author Ralph Kyburz 
 */
 
 // Variable definitions
 float x1;
 float x2;
 float y1;
 float y2;
 int r;
 PFont font;
 boolean running;
 

RandomLines(){
 font = createFont("Chalkduster",42);
 textFont(font, 42);
 textSize(42);
 
 running = true;
}
void run(){
  while(running){
   fill(0);
   rect(0, 0, 500, 500);
   drawLines();
   text("Beards 4 life!",175,250);
   noFill();
 }
}

void stopp(){
  running = false;
}

void setRandomValues(){
 x1 = random(0,500);
 y1 = random(0,500); 
 x2 = random(0,500);
 y2 = random(0,500);
}

void drawLines(){
 r = (int) random(400,600);
 for (int i = 0; i < r; i++){
   setRandomValues();
   stroke(0,255,0);
   line(x1, y1, x2, y2);
   noStroke();
 }
}
}
/*****************************************************************/

