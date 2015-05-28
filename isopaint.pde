ArrayList<Triangle> triangles;
void setup() {
  noSmooth();
  noStroke();
  size(500, 500);
  triangles = new ArrayList<Triangle>();
  float triangleSize=height/10;
  float offset=triangleSize/2;
  float ax, ay, bx, by, cx, cy;
  float x = -triangleSize;
  float y = 0;
  int row = 0;
  for (int i=0; i < height + triangleSize; i += triangleSize) {
    for (int j=0; j < width + triangleSize; j += triangleSize) {
      ax = x;
      ay = y + triangleSize;
      bx = x + triangleSize;
      by = y + triangleSize;
      cx = x + triangleSize/2;
      cy = y;
      triangles.add(new Triangle(ax, ay, bx, by, cx, cy));
      x += triangleSize/2;
      ax = x;
      ay = y;
      bx = x + triangleSize;
      by = y;
      cx = x + triangleSize/2;
      cy = y + triangleSize; 
      triangles.add(new Triangle(ax, ay, bx, by, cx, cy));
      x += triangleSize/2;
    }
    row++;
    if (row % 2 == 0) {
      x = -triangleSize;
    } else {
      x = -offset;
    }
    y += triangleSize;
  }
}

void draw() {
  background(170, 170, 170);
  for (int i = 0; i < triangles.size (); i++) {
    Triangle t = triangles.get(i);
    t.display();
  }
}

void mouseDragged() {
  for (int i = 0; i < triangles.size (); i++) {
    Triangle t = triangles.get(i);
    if (t.cursorInside()) {
      if (mouseButton == LEFT) {
        t.darken();
      } else { 
        t.lighten();
      }
    }
  }
}

