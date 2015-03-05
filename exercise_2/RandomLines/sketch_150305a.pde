/*
 * Random lines.
 * MMF exercise 2
 *
 * some simple code to draw random lines
 * @author Ralph Kyburz 
 */
 
 // Variable definitions
 float x1;
 float x2;
 float y1;
 float y2;
 int r;
 

void setup(){
 size(500, 500);
 background(255);
 r = (int) random(50)+10;
 println("Es werden "+ r +" Striche gezeichnet");
 for (int i = 0; i < r; i++){
   setRandomValues();
   line(x1, y1, x2, y2);
 }
}

void draw(){
 // nicht nötig da kein Loop
}

void setRandomValues(){
 println("********");
 x1 = random(width);
 print(x1);
 y1 = random(height); 
 print(" "+ y1);
 x2 = random(width);
 print(" "+ x2);
 y2 = random(height);
 println(" "+ y2);
}

