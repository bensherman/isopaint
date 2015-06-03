RhombusGrid grid = new RhombusGrid();
float offset = 30;
int largestWidth;
int largestHeight;
float smallestOffset = offset;
boolean debug = false;

void setup() {
  noSmooth();
  size(500, 500);
  largestWidth = width;
  largestHeight = height;
  frame.setResizable(true);
  grid.createGrid(offset);
}

void draw() {
  background(128);
  if (width > largestWidth ) {
    grid = growGrid(grid);
    println("oldwidth: ", largestWidth, "newidth: ", width);
    largestWidth = width;
  }
  if (height > largestHeight) {
    grid = growGrid(grid);
    println("oldheight: ", largestHeight, "newheight: ", height);
    largestHeight = height;
  }
  grid.displayAll();
}


void keyPressed() {
  if (key == 'a') {
    if (offset > 5) {
      offset *= .90;
      grid = shrinkOffset(grid);
    }
  }
  if (key == 'z') {
    if (offset < 100) {
      offset *= 1.1;
      grid = growOffset(grid);
    }
  }
  if (key == 'd') {
    debug = !debug;
  }
  if (key == 'r') {
    grid.turnRed();
  }
  if (key == 'g') {
    grid.turnGreen();
  }
  if (key == 'b') {
    grid.turnBlue();
  }
}

void mousePressed() {
  grid.mouseClick();
}

