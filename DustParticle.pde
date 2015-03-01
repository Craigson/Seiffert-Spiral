class DustParticle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass, strength;
  float x,y,z;
  ArrayList <PVector> history;
  float theta, dt;
  
  DustParticle(PVector pt) {
    mass = random(5,15);
    location = new PVector(pt.x,pt.y,pt.z);
    velocity = new PVector(0, 0, 0);
    acceleration = new PVector(0, 0, 0);
    history = new ArrayList <PVector>();
    theta = 0;
    dt = 0.001;
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }


  void update() {
    location.add(acceleration);
    acceleration.mult(0);
    theta += dt;
    mass += 0.0001;
  }

  void display() {
    PVector loc = location.get();
    noStroke();
    fill(255);
    pushMatrix();
    translate(location.x, location.y, location.z);
    sphere(0.8);
    history.add(loc.get());
    popMatrix();
  }


  PVector influence(DustParticle d) {
    PVector force = PVector.sub(location, d.location);             // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    //multiply mass to speed up rotation
    strength = (100 * mass) / (distance * distance * distance + 100.0); // Calculate gravitional force magnitude
    force.mult(strength);                                         // Get force vector --> magnitude * direction
    return force;
    //flip vector around to add rotation (cross producT)
    //return new PVector(force.z,-force.y, force.x);
  }
  
    void drawTail() {
    noFill();
    //fill(c);
    strokeWeight(1);
    stroke(255,15);
    beginShape();

    for (PVector v : history) {
      vertex(v.x, v.y, v.z);
    }
    endShape();
  }
}
