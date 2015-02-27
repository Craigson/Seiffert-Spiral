/* Craig Pickard, 2015
 The particles in the particle system follow a spherical curved
 path, known as a Seiffert spherical spiral.  The x,y,z values
 are calculated using Jacobi elliptic functions, which are
 computed using Python.  These values are imported in separate
 text files.
 */


//import PeasyCam library to manage camera controls
import peasy.PeasyCam;
import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam; //declare the peasy cam object

//define string variables for each of the text files
String xValString = "xValsRaw.txt";
String yValString = "yValsRaw.txt";
String zValString = "zValsRaw.txt";

//create arrays for storing the x,y and z-values for each
//point on the curve
float [] xVals = new float[1000];
float [] yVals = new float[1000];
float [] zVals = new float[1000];

PVector point; //vector to store the location on the curve
int counter = 0; //used to cycle through array of location values
float theta, dtheta;
ArrayList<Particle>particles;
int numParticles = 12;
float rotateCount = TWO_PI/numParticles;

void setup() {
  size(800, 800, P3D);
  background(220);
  translate(width/2, height/2);
  theta = 0;
  dtheta = 0.00001;

  particles = new ArrayList<Particle>();
  
  cam = new PeasyCam(this, 0, 0, 0, 600); //initialise the peasycam object
  cam.setMinimumDistance(430); //set minimum zoom distance
  cam.setMaximumDistance(1500); //set maximum zoom distance

  for (int i = 0; i < numParticles; i++) {
    particles.add(new Particle());
  }
  
  //load x,y and z values from respective text files created by
  //by the python script
  String [] rawX = loadStrings(xValString);
  String [] rawY = loadStrings(yValString);
  String [] rawZ = loadStrings(zValString);

  //create an array of multiple strings to parse as floats;
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

//cycle through the arraylist of particles
  for (Particle p : particles) {
     point = new PVector (xVals[counter], yVals[counter], zVals[counter]);
    pushMatrix();
    p.display(point);
    p.drawTail(counter);
    popMatrix();
    rotateZ(1);
  }

  counter++;
  theta += dtheta;
  println(frameRate);
  // hint(DISABLE_DEPTH_TEST);
  // fill(220);
  // noStroke();
  // sphere(200);
}

//pressing the 's' key saves the current image on the screen
void save() {
  float a = random(0, 1000);
  int b = int(a);
  save("images/generative_" + str(b) + ".jpg");
}

void keyPressed() {
  if (key == 's') {
    println("file saved");
    save();
  }
}
