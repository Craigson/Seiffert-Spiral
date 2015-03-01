class DustCloud {

  ArrayList <DustParticle> cloud;

  DustCloud(int nums, PVector p) {
    cloud = new ArrayList<DustParticle>();
    
    for (int i = 0; i < nums; i++) {
      cloud.add(new DustParticle(p));
    }
  }

  void run() {
    for (DustParticle d : cloud) {
      for (DustParticle d1 : cloud) {
        PVector force = d1.influence(d);
        d.applyForce(force);
      }
      d.display();
      d.update();
      d.drawTail();
      
    }
  }
}
