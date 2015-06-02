RhombusGrid grid = new RhombusGrid();
float offset;
float largestWidth;
float largestHeight;


void setup() {
  noSmooth();
  noStroke();
  size(500, 500);
  largestWidth = width;
  largestHeight = height;
  frame.setResizable(true);
  grid.createGrid(20);
}

void draw() {
  background(128);
  if (width >= largestWidth ) {
    grid = growGrid(grid);
    println("oldwidth: ", largestWidth, "newidth: ", width);
    largestWidth = width;
  }
  if (height >= largestHeight) {
    grid = growGrid(grid);
    println("oldheight: ", largestHeight, "newheight: ", height);

    largestHeight = height;
  }
  grid.displayAll();
}

RhombusGrid growGrid(RhombusGrid oldGrid) {
  RhombusGrid newGrid = new RhombusGrid();
  newGrid.createGrid(offset);
  for (int row = 0; row < oldGrid.xCount; row++) {
    arrayCopy(oldGrid.myGrid[row], newGrid.myGrid[row], oldGrid.myGrid[row].length);
  }     
  return newGrid;
}


class RhombusGrid {
  int xCount;
  int yCount;
  Rhombus[][] myGrid;

  void createGrid(float tempOffset) {
    offset = tempOffset;
    xCount = int((largestWidth/offset/4) + 2);
    yCount = int((largestHeight/offset) + 2);
    println("creating grid", xCount, yCount);
    myGrid = new Rhombus[xCount][yCount];
    for (int column = 0; column < yCount; column++) {
      for (int row = 0; row < xCount; row++) {
        if (column % 2 == 0) {
          myGrid[row][column] = new Rhombus(row * offset * 4, column * offset);
          println("even row: ", row, column, offset);
        } else {
          myGrid[row][column] = new Rhombus(row * offset * 4 + offset * 2, column * offset);
          println("odd row: ", row, column, offset);
        }
      }
    }
  }

  void display(int x, int y) {
    myGrid[x][y].display();
  }

  void displayAll() {
    for (int row = 0; row < xCount; row++) {
      for (int column = 0; column < yCount; column++) {
        this.display(row, column);
      }
    }
  }
}  

class Rhombus {
  float centerX, centerY;
  color leftFill = 100;
  color rightFill = 128;

  Rhombus() {
  }

  Rhombus(float x, float y) {
    centerX = x;
    centerY = y;
  }

  void leftTriangleDisplay() {
    fill(leftFill);
    triangle(centerX, centerY - offset, //top
    centerX - (offset * 2), centerY, //left
    centerX, centerY + offset);         //bottom
    noFill();
  }

  void rightTriangleDisplay() {
    fill(rightFill);
    triangle(centerX, centerY - offset, 
    centerX + (offset * 2), 
    centerY, centerX, centerY + offset);
    noFill();
  }

  void display() {
    rightTriangleDisplay();
    leftTriangleDisplay();
    fill(255, 0, 0);
    ellipse(centerX, centerY, 3, 3);
    noFill();
  }
}
