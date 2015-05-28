class Triangle {
  float ax;
  float ay;
  float bx;
  float by;
  float cx;
  float cy;
  boolean filled = true;
  color fillColor = 255;

  Triangle (float tempAX, float tempAY, float tempBX, float tempBY, float tempCX, float tempCY) {
    ax = tempAX;
    ay = tempAY;
    bx = tempBX;
    by = tempBY;
    cx = tempCX;
    cy = tempCY;
    println("new triangle: ", ax, ay, bx, by, cx, cy);
  }

  float area() {  
    return area(ax, ay, bx, by, cx, cy);
  }

  float area(float ax, float ay, float bx, float by, float cx, float cy) {
    float ta = ax - cx;
    float tb = ay - cy;
    float tc = bx - cx;
    float td = by - cy;
    float area = (.5 * (abs((ta*td) - (tb*tc))));
    return area;
  }

  boolean cursorInside() {
    /* figure out if a point is inside of a triangle.
     make a triangle out each of the vertexes and the x,y of the point to be discovered.
     sum area.  if equal to area of main triangle, point is inside.  if greater, it is not.
     */
    float ta = area(mouseX, mouseY, bx, by, cx, cy);
    float tb = area(ax, ay, mouseX, mouseY, cx, cy);
    float tc = area(ax, ay, bx, by, mouseX, mouseY);
    return (ta + tb + tc <= area());
  }

  void darken() {
    fillColor -= 85;
    if (fillColor < 0) {
      fillColor=0;
    }
  }
  
  void lighten() {
    fillColor += 85;
    if (fillColor > 255) {
      fillColor=255;
    }
  }
  
  void display() {
    if (filled) {
      fill(fillColor);
    } else {
      noFill();
    }
    triangle(ax, ay, bx, by, cx, cy);
  }
}

