class Particle {

  float rad;
  PVector loc;
  float theta, dtheta;
  float zPos;
  ArrayList<PVector> history;
  int timer;

  Particle() {
    rad = 0;
    theta = 0.0;
    dtheta += 0.3;
    zPos = 0;
    history = new ArrayList<PVector>();
    timer = 0;
  }


void update() {
  //   origin = _origin.get();
  //   rad = zPos/2;
  //   loc = new PVector(rad*cos(theta) + origin.x, rad*sin(theta) + origin.y, zPos);
  //   zPos += 0.06;
  //   rad += 0.007;
  //   theta += dtheta;
    
    if (history.size() > 500){
      history.remove(0);
    }
  }


  void display(PVector location) {
 
    
    loc = location.get();
    pushMatrix();
    //translate(width/2,height/2);
    fill(200,50,50,40);
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    sphere(1);
    history.add(loc.get());
    popMatrix();
    popMatrix();
  }

  void drawTail(int counter) {
    beginShape();
    noFill();
    strokeWeight(1);
    stroke(40,30);
    
    if (counter > 2000){
      history.clear();
    }
    
    for (PVector v : history) {
      vertex(v.x, v.y, v.z);
    }
    endShape();
  }
}
