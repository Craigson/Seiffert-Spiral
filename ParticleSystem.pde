class ParticleSystem {

  ArrayList <Particle> particles;
  int numParticles;
  PVector point; //vector to store the location on the curve
  float[] xVals, yVals, zVals;
  int counter;
  int offset;
  int dc;

  ParticleSystem(int _nums, float[] _x, float [] _y, float [] _z, int _offset) {
    particles = new ArrayList<Particle>();
    numParticles = _nums;
    xVals = _x;
    yVals = _y;
    zVals = _z;
    counter = _offset;
    dc = 1;

    for (int i = 0; i < numParticles; i++) {
      particles.add(new Particle());
    }
  }



  void run() {
    if (counter < 2 || counter > 998) {
      dc *= -1;
    }
  point = new PVector (xVals[counter], yVals[counter], zVals[counter]);
    //cycle through the arraylist of particles
    for (Particle p : particles) {
    
      pushMatrix();
      p.display(point);
      p.drawTail(counter);
      popMatrix();
      rotateZ(1);
    }
    
    counter += dc;
  }
  
}
