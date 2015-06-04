class Rhombus {
  float centerX, centerY;
  float topX, topY;
  float bottomX, bottomY;
  float leftX, leftY;
  float rightX, rightY;
  color brushIndexLeft;
  color brushIndexRight;
  ArrayList<Integer> colors;


  Rhombus() {
  }

  Rhombus(float x, float y) {
    centerX = x;
    centerY = y;
    topX    = centerX;
    topY    = centerY - offset;
    bottomX = centerX;
    bottomY = centerY + offset;
    leftX   = centerX - (offset * 2);
    leftY   = centerY;
    rightX  = centerX + (offset * 2);
    rightY  = centerY;
    colors = new ArrayList<Integer>();
    colors.add(color(0)); //black
    colors.add(color(100)); //dark grey
    colors.add(color(200)); //light grey
    colors.add(color(255)); //white
    brushIndexLeft = colors.size() - 1;
    brushIndexRight = colors.size() - 1;
  }

  void turnRed() {
    colors.set(0, color(#801916));
    colors.set(1, color(#AA3C39));
    colors.set(2, color(#D46D6A));
    colors.set(3, color(#FFACAA));
  }

  void turnGreen() {
    colors.set(0, color(#3A5000));
    colors.set(1, color(#5D7814));
    colors.set(2, color(#83A136));
    colors.set(3, color(#DBF1A1));
  }

  void turnBlue() {
    colors.set(0, color(#123552));
    colors.set(1, color(#2A4F6E));
    colors.set(2, color(#496C89));
    colors.set(3, color(#718DA5));
  }

  void cycleColorsLeft() {
    brushIndexLeft++;
    brushIndexLeft %= colors.size();
  }

  void cycleColorsRight() {
    brushIndexRight++;
    brushIndexRight %= colors.size();
  }

  void cycleColorsReverseRight() {
    brushIndexRight--;
    if (brushIndexRight < 0) {
      brushIndexRight = colors.size() + brushIndexRight;
    }
  }

  void cycleColorsReverseLeft() {
    brushIndexLeft--;
    if (brushIndexLeft < 0) {
      brushIndexLeft = colors.size() + brushIndexLeft;
    }
  }

  void leftTriangleDisplay() {
    fill(colors.get(brushIndexLeft));
    triangle(topX, topY, leftX, leftY, bottomX, bottomY);
    noFill();
  }

  void rightTriangleDisplay() {
    fill(colors.get(brushIndexRight));
    triangle(topX, topY, rightX, rightY, bottomX, bottomY);
    noFill();
  }

  void display() {
    rightTriangleDisplay();
    leftTriangleDisplay();
    if (debug) {
      fill(255, 0, 0);
      stroke(1);
      ellipse(centerX, centerY, 3, 3);
      noFill();
    } else {
      noStroke();
    }
  }

  boolean insideLeft() {
    /* figure out if a point is inside of a triangle.
     make a triangle out each of the vertexes and the x,y of the point to be discovered.
     sum area.  if equal to area of main triangle, point is inside.  if greater, it is not.  */
    float a = area(pmouseX, pmouseY, leftX, leftY, bottomX, bottomY);
    float b = area(topX, topY, pmouseX, pmouseY, bottomX, bottomY);
    float c = area(topX, topY, leftX, leftY, pmouseX, pmouseY);
    return (a + b + c <= areaLeft());
  }  

  boolean insideRight() {
    float a = area(pmouseX, pmouseY, rightX, rightY, bottomX, bottomY);
    float b = area(topX, topY, pmouseX, pmouseY, bottomX, bottomY);
    float c = area(topX, topY, rightX, rightY, pmouseX, pmouseY);
    return (a + b + c <= areaRight());
  }

  float areaLeft() {
    return area(topX, topY, leftX, leftY, bottomX, bottomY);
  }

  float areaRight() {
    return area(topX, topY, rightX, rightY, bottomX, bottomY);
  }

  float area(float ax, float ay, float bx, float by, float cx, float cy) {
    float ta = ax - cx;
    float tb = ay - cy;
    float tc = bx - cx;
    float td = by - cy;
    float area = (.5 * (abs((ta*td) - (tb*tc))));
    return area;
  }
}

