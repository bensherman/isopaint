class RhombusGrid {
  int xCount;
  int yCount;
  Rhombus[][] myGrid;

  void createGrid(float tempOffset) {
    offset = tempOffset;
    xCount = int(((largestWidth / smallestOffset) / 4.0) + 2);
    yCount = int((largestHeight / smallestOffset) + 2);
    println("creating grid", xCount, yCount);
    myGrid = new Rhombus[xCount][yCount];
    for (int column = 0; column < yCount; column++) {
      for (int row = 0; row < xCount; row++) {
        if (column % 2 == 0) {
          myGrid[row][column] = new Rhombus(row * offset * 4, column * offset);
        } else {
          myGrid[row][column] = new Rhombus(row * offset * 4 + offset * 2, column * offset);
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
        display(row, column);
      }
    }
  }
}  

RhombusGrid growGrid(RhombusGrid oldGrid) {
  RhombusGrid newGrid = new RhombusGrid();
  newGrid.createGrid(offset);
  for (int row = 0; row < oldGrid.xCount; row++) {
    arrayCopy(oldGrid.myGrid[row], newGrid.myGrid[row], oldGrid.myGrid[row].length);
  }
  return newGrid;
}

RhombusGrid growOffset(RhombusGrid oldGrid) {
  RhombusGrid newGrid = new RhombusGrid();
  newGrid.createGrid(offset);
  for (int column = 0; column < oldGrid.yCount; column++) {
    for (int row = 0; row < oldGrid.xCount; row++) {
      newGrid.myGrid[row][column].leftFill = oldGrid.myGrid[row][column].leftFill;
      newGrid.myGrid[row][column].rightFill = oldGrid.myGrid[row][column].rightFill;
    }
  }
  return newGrid;
}

RhombusGrid shrinkOffset(RhombusGrid oldGrid) {
  if (offset < smallestOffset) {
    smallestOffset = offset;
  }

  println("offset, smallestoffset: ", offset, smallestOffset);
  RhombusGrid newGrid = new RhombusGrid();
  newGrid.createGrid(offset);
  grid.myGrid[13][51].rightFill = 255;
  grid.myGrid[13][51].leftFill = 255;

  for (int column = 0; column < oldGrid.yCount; column++) {
    for (int row = 0; row < oldGrid.xCount; row++) {
      newGrid.myGrid[row][column].leftFill = oldGrid.myGrid[row][column].leftFill;
      newGrid.myGrid[row][column].rightFill = oldGrid.myGrid[row][column].rightFill;
    }
  }
  return newGrid;
}

