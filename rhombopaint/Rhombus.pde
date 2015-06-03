class Rhombus {
  float centerX, centerY;
  color leftFill = 255;
  color rightFill = 255;

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
    if (debug) {
      fill(255, 0, 0);
      ellipse(centerX, centerY, 3, 3);
      noFill();
    }
  }
}

