ArrayList<Triangle> triangles;

void setup() {
  background(255, 192, 0);
  fill(255);
  stroke(1);
  triangles = new ArrayList<Triangle>();
  triangles.add(new Triangle(width/2, height/3, 
  width/2 - height/6, 2*height/3, 
  width/2 + height/6, 2*height/3));
}


void draw() {
  for (int i = 0; i < triangles.size (); i++) {
    Triangle t = triangles.get(i);
    t.display();
  }
}


