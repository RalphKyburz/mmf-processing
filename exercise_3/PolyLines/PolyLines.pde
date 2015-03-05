/*
 * Draw polylines.
 * MMF exercise 3
 *
 * some code to draw some polylines with the mouse
 * @author Ralph Kyburz 
 */


// Variable definition
int xStartpoint;
int yStartpoint;
int xEndpoint;
int yEndpoint;
boolean draw;
color currentColor;
ArrayList<Line> lines;


void setup() {
  size(700, 700);
  lines = new ArrayList();
  reset();
}


void draw() {
  if (draw == true) {
    Line myLine = new Line(xStartpoint, yStartpoint, xEndpoint, yEndpoint, currentColor);
    lines.add(myLine);

    for (int i = 0; i < lines.size (); i++) {
      Line line = lines.get(i);
      line.display();
    }
  }
}

void reset() {
  draw = false;
  background(255);
  currentColor = color(0, 0, 0);
  strokeCap(SQUARE);

  // remove elements from array
  for (int i = lines.size () - 1; i >= 0; i--) {
    Line line = lines.get(i);
    lines.remove(i);
  }

  xStartpoint = 0;
  yStartpoint = 0;
  xEndpoint = 0;
  yEndpoint = 0;
}

void mousePressed() {
  draw = false;  
  if (xStartpoint == 0 && yStartpoint == 0) {
    xStartpoint = mouseX;
    yStartpoint = mouseY;
  } else {
    xStartpoint = xEndpoint;
    yStartpoint = yEndpoint;
  }
}

void mouseReleased() {
  xEndpoint = mouseX;
  yEndpoint = mouseY;
  draw = true;
}

void keyPressed() {
  if (key == DELETE) {
    reset();
  } else if (key == 'r') {
    draw = false;
    currentColor = color(255, 0, 0);
  } else if (key == 'g') {
    draw = false;
    currentColor = color(0, 255, 0);
  } else if (key == 'b') {
    draw = false;
    currentColor = color(0, 0, 255);
  } else if (key == 's') {
    draw = false;
    currentColor = color(0, 0, 0);
  } else if (key == 'R') {
    changeAllColors(color(255, 0, 0));
  } else if (key == 'G') {
    changeAllColors(color(0, 255, 0));
  } else if (key == 'B') {
    changeAllColors(color(0, 0, 255));
  } else if (key == 'S') {
    changeAllColors(color(0, 0, 0));
  }
}

void changeAllColors(color mycolor) {
  for (int i = 0; i < lines.size (); i++) {
    Line line = lines.get(i);
    line.setColor(mycolor);
    line.display();
  }
}  


/* Classe Line */
class Line {

  //variable definitions
  int startX;
  int startY;
  int endY;
  int endX;
  color linecolor;

  Line (int xStartpoint, int yStartpoint, int xEndpoint, int yEndpoint, color linecolor) {
    startX = xStartpoint;
    startY = yStartpoint;
    endX = xEndpoint;
    endY= yEndpoint;
    this.linecolor = linecolor;
  }

  void display() {
    stroke(linecolor);
    line(startX, startY, endX, endY);
  }

  void setColor(color mycolor) {
    linecolor=mycolor;
  }
}

