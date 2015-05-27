class Triangle {
  int ax;
  int ay;
  int bx;
  int by;
  int cx;
  int cy;

  Triangle (int tempAX, int tempAY, int tempBX, int tempBY, int tempCY, int tempCX){
    ax = tempAX;
    ay = tempAY;
    bx = tempBX;
    by = tempBY;
    cx = tempCX;
    cy = tempCY;
  }
  
  float area() {  
    return area(ax, ay, bx, by, cx, cy);
  }

  float area(int ax, int ay, int bx, int by, int cx, int cy) {
    int ta = ax - cx;
    int tb = ay - cy;
    int tc = bx - cx;
    int td = by - cy;
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

  void display() {
    triangle(ax, ay, bx, by, cx, cy);
  }
}

