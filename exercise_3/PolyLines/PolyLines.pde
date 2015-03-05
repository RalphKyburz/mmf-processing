/*
 * Draw polylines.
 * MMF exercise 3
 *
 * some code to draw some polylines with the mouse
 *
 * HOW TO USE:
 * Polyline starts with pressing the left mouse button and ends with release of the mousebutton.
 * The next polyline starts at the end of the last drawn line.
 * by pressing r,b,g,s the color of the next polyline to be drawn can be selected. / R(ed), B(lue), G(reen), S(chwarz /black)
 * by pressing  R,B,G,S all the polylines will be set to the selected color. / R(ed), B(lue), G(reen), s(schwarz / black)
 * by pressing DELETE the drawing will be deleted. You can start from scratch.
 *
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
PGraphics pg;


void setup() {
  size(700, 700);
  pg = createGraphics(700, 700);
  lines = new ArrayList();
  reset();
}

void draw() {
  image(pg, 0, 0);
  if (draw == true) {
    pg.beginDraw();
    Line myLine = new Line(xStartpoint, yStartpoint, xEndpoint, yEndpoint, currentColor);
    lines.add(myLine);

    for (int i = 0; i < lines.size (); i++) {
      Line line = lines.get(i);
      line.display();
      pg.endDraw();
      image(pg, 0, 0);
      draw = false;
      
    }
  }
}

void reset() {
  draw = false;
  pg.beginDraw();
  pg.background(255);
  pg.endDraw();
  currentColor = color(0, 0, 0);

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
  print("Total of lines in stack");
  print(lines.size());
  pg.clear();
  pg.beginDraw();
  for (int i = 0; i < lines.size (); i++) {
    Line line = lines.get(i);
    line.setColor(mycolor);
    line.display();
  }
  pg.endDraw();
  image(pg, 0, 0);
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
    pg.stroke(linecolor);
    pg.line(startX, startY, endX, endY);
  }

  void setColor(color mycolor) {
    linecolor=mycolor;
  }
}

