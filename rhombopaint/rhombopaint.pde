RhombusGrid grid = new RhombusGrid();
float offset = 30;
int largestWidth;
int largestHeight;
float smallestOffset = offset;
color draggedColor;
boolean debug = false;
ArrayList<String> helpText;
boolean help = true;

void setup() {
  size(500, 500);
  largestWidth = width;
  largestHeight = height;
  frame.setResizable(true);
  grid.createGrid(offset);
  helpText = new ArrayList<String>();
  helpText.add("leftclick/rightclick: cycle through shades");
  helpText.add("click&drag: drag the color around");
  helpText.add("a: shrink triangles");
  helpText.add("z: grow triangles");
  helpText.add("r: color (r)ed");
  helpText.add("g: color (g)reen");
  helpText.add("b: color (b)lue");
  helpText.add("w: black and (w)hite");
  helpText.add("s: save as png");
  helpText.add("?: hide/display this help");  
  helpText.add("");
  helpText.add("Thanks for playing.");
  helpText.add("");
  helpText.add("Love, Ben Sherman");
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
  if (help) {
    displayHelp();
  }
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
  if (key == 's') {
    selectOutput("filename to save to (png will be appended): ", "fileSelected");
  }
  if (key == 'h' || key == '?') {
    help = !help;
  }
}

void mouseClicked() {
  grid.mouseClick();
}

void mouseDragged() {
  grid.mouseDrag();
}

void mousePressed() {
  grid.mousePress();
}

void displayHelp() {
  fill(100);
  smooth();
  textSize(20);
  for(int i = 0; i < helpText.size(); i++){
    text(helpText.get(i), 21, 41 + i * 20);
  }
  fill(100,100,200);
    for(int i = 0; i < helpText.size(); i++){
    text(helpText.get(i), 20, 40 + i * 20);
  }
  noFill();
  noSmooth();
}

