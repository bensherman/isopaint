ArrayList<Triangle> triangles;
int originalHeight;
int originalWidth;
color draggedColor = 0;
float triangleRatio = 10;

boolean debug = false;

void setup() {
  noSmooth();
  noStroke();
  size(500, 500);
  frame.setResizable(true);
  triangleRatio = 10;
  createGrid(triangleRatio);
  originalHeight = height;
  originalWidth = width;
}

void createGrid(float newTriangleRatio) {
  triangles = new ArrayList<Triangle>();
  float triangleSize=height/newTriangleRatio;
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
  demoTriangle();
}

void draw() {
  background(100, 100, 100);
  if (originalWidth != width || originalHeight != height) {
    if (debug) {
      println("resizing");
    }
    createGrid(triangleRatio);
    originalWidth = width;
    originalHeight = height;
  }  
  for (int i = 0; i < triangles.size (); i++) {
    Triangle t = triangles.get(i);
    t.display();
  }
}

void mousePressed() {
  for (int i = 0; i < triangles.size (); i++) {
    Triangle t = triangles.get(i);
    if (t.cursorInside()) {
      if (mouseButton == RIGHT && !keyPressed) {
        t.cycleColors();
      } else if (mouseButton == LEFT && !keyPressed) {
        t.cycleColorsReverse();
      }
      draggedColor = t.brushIndex;
    }
  }
}

void mouseDragged() {
  for (int i = 0; i < triangles.size (); i++) {
    Triangle t = triangles.get(i);
    if (t.cursorInside() && mouseButton == LEFT && keyPressed && keyCode == SHIFT) {
      t.brushIndex = draggedColor;
    }
  }
}

void keyPressed() {
  if (debug) {
    println(key);
  }  
  if (key == 's' || key ==  'S') {
    selectOutput("filename to save to (png will be appended): ", "fileSelected");
  } else if (key == '-') {
    triangleRatio *= 1.1;
    if (debug) {
      println("-", triangleRatio);
    }    
    if (triangleRatio > height/20) {
      triangleRatio = height/20;
    } else {
      createGrid(triangleRatio);
    }
  }
  if (key == '+') {
    if (debug) {
      println("+", triangleRatio);
    }    
    triangleRatio *= .9;
    if (triangleRatio < .5) {
      triangleRatio = .5;
    } else {
      createGrid(triangleRatio);
    }
  }
  if (key == 'r') {
    for (int i = 0; i < triangles.size (); i++) {
      triangles.get(i).turnRed();
    }
  }  
  if (key == 'g') {
    for (int i = 0; i < triangles.size (); i++) {
      triangles.get(i).turnGreen();
    }
  }
  if (key == 'b') {
    for (int i = 0; i < triangles.size (); i++) {
      triangles.get(i).turnBlue();
    }
  }
}

void fileSelected(File selection) {
  if ( selection != null ) {
    save(selection.getAbsolutePath() + ".png");
  }
}

void demoTriangle() {
  for (int i = 0; i < triangles.size (); i++) {
    Triangle t = triangles.get(i);
    if (t.centerTriangle()) {
      t.cycleColorsReverse();
    }
  }
}

