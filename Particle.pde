class Particle {

  float rad;
  PVector loc;
  float theta, dtheta;
  float zPos;
  int timer;
  ArrayList<PVector> history;
  color c;
  float mass;


  Particle() {
    rad = 0;
    theta = 0.0;
    dtheta += 0.3;
    zPos = 0;
    timer = 0;
    history = new ArrayList<PVector>();
    c = color(random(80, 200));
    mass = 5;
  }

  PVector attract(DustParticle d) {
    PVector force = PVector.sub(loc, d.location);             // Calculate direction of force
    float distance = force.mag();    // Distance between objects
   distance = constrain(distance,10,300);
   float strength = (1000*mass) / (distance * distance * distance + 20.0); // Calculate gravitional force magnitude
    force.mult(strength);                                         // Get force vector --> magnitude * direction
    return force;
  }

  void update() {
    if (history.size() > 500) {
      history.remove(0);
    }
  }


  void display(PVector location) {

    loc = location.get();
    pushMatrix();
    //translate(width/2,height/2);
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    history.add(loc.get());
    fill(255);
    sphere(1);
    popMatrix();
    popMatrix();
  }

  void drawTail(int counter) {
    noFill();
    //fill(c);
    strokeWeight(1);
    stroke(255, 120);
    beginShape();
    if (counter > 1000) {
      history.clear();
    }

    for (PVector v : history) {
      vertex(v.x, v.y, v.z);
    }
    endShape();
  }
}
