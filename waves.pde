float a = 0;
float res = 150;
float[] resarr = new float[int(res) + 1];
float s = 10;


void setup() {
  size(1280, 720);
  background(255);
  smooth();
}


void draw() {
  background(255);
  a += .1;
  addToArray();
  drawCurve();
  hideEdges();
  //drawEllipses();
  //render();
}


// fill array with y positions
void addToArray() {
  for (int i = 0; i < res + 1; i++) {
    float y = sin(-a + i * .1) * s / 5 + sin(a + i * .2) * s / 2 + sin(a / 2 + i * .3) * s + cos(a + i * .04) * s;
    resarr[i] = y;
  }
}
 

// draw curve from array
void drawCurve() {
  beginShape();
  curveVertex(0, height);
  curveVertex(0, height);
  for (int i = 0; i < res + 1; i++) {
    float x = (width / res) * i;
    fill(0);
    noStroke();
    curveVertex(x, height / 4 + resarr[i]);
  }
  curveVertex(width, height);
  curveVertex(width, height);
  endShape(CLOSE);
}


// draw ellipses (to check movement)
void drawEllipses() {
  for (int i = 0; i < res + 1; i++) {
    float x = (width / res) * i;
    noFill();
    stroke(0);
    strokeWeight(1);
    ellipse(x, height / 4 + resarr[i], 5, 5);
  }
}


// draw a rectangle with a thick border around the sketch to hide curve en points
void hideEdges() {
  stroke(255);
  noFill();
  strokeWeight(40);
  rect(0, 0, width, height);
}


// render frames to disk
void render() {
  saveFrame("renders_02/frame_####.png");
}
