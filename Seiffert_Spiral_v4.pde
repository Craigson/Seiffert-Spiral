import peasy.PeasyCam;
import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam; //declare the peasy cam object

//Axis axis;

//load x,y and z values from respective text files created by
//the python side
String xValString = "xValsRaw.txt";
String yValString = "yValsRaw.txt";
String zValString = "zValsRaw.txt";

float [] xVals = new float[1000];
float [] yVals = new float[1000];
float [] zVals = new float[1000];

PVector point;
int counter = 0;
float theta, dtheta;
ArrayList<Particle>particles;
int numParticles = 12;
float rotateCount = TWO_PI/numParticles;

void setup() {
  size(800, 800, P3D);
  background(220);
  translate(width/2,height/2);
  theta = 0;
  dtheta = 0.00001;

  particles = new ArrayList<Particle>();
  cam = new PeasyCam(this, 0, 0, 0, 600); //initialise the peasycam object
  cam.setMinimumDistance(430); //set minimum zoom distance
  cam.setMaximumDistance(1500); //set maximum zoom distance

  for (int i = 0; i < numParticles; i++) {
    particles.add(new Particle());
  }

  //create an array of multiple strings (ie. each word);
  String [] rawX = loadStrings(xValString);
  String [] rawY = loadStrings(yValString);
  String [] rawZ = loadStrings(zValString);

  String [] xStrings = splitTokens(rawX[0], ",");
  String [] yStrings = splitTokens(rawY[0], ",");
  String [] zStrings = splitTokens(rawZ[0], ",");

  //parse the string values to floats and store in separate arrays
  for (int i = 0; i < xStrings.length; i++) {
    xVals[i] = Float.parseFloat(xStrings[i]);
    yVals[i] = Float.parseFloat(yStrings[i]);
    zVals[i] = Float.parseFloat(zStrings[i]);
  }

  point = new PVector(0, 0, 0);
  camera();
}

void draw() {
  lights();
  //rotateZ(theta);
  background(180);
  //axis.display();
  if (counter == 1000) {
    counter = 0;
  }
  
  for (Particle p : particles) {
    
    
    point = new PVector (xVals[counter], yVals[counter], zVals[counter]);
    pushMatrix();
   // p.update();
   //translate(width/2,height/2);
    p.display(point);
    p.drawTail(counter);
    popMatrix();
    rotateZ(1);
  }

  counter++;
  theta += dtheta;
  // println(frameRate);
  // hint(DISABLE_DEPTH_TEST);
  // fill(220);
  // noStroke();
  // sphere(200);
}


void save(){
  float a = random(0,1000);
  int b = int(a);
  save("images/generative_" + str(b) + ".jpg");
}

void keyPressed(){
  if (key == 's'){
    println("file saved");
    save();
  }
}
