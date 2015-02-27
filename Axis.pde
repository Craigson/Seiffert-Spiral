class Axis {
  
  Axis(){
    
  }
  
  void display(){
      pushMatrix();
  stroke(0, 0, 255); //x-axis is blue
  line(-100, 0, 100, 0);
  stroke(255, 0, 0); //y-axis is red
  line (0, -100, 0, 100);
  stroke(0, 255, 0); // z- axis is green
  line(0, 0, -100, 0, 0, 100);
  fill(255,100);
  noStroke();
  rect(0,0,200,200);
  popMatrix();
  
  }
  
}
