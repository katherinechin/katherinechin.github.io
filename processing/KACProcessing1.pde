/* float shade = 0.0;
float change = 1.0; */

float rotsp = 0.0;

int state = 0;
int r = 255;
int g = 0;
int b = 0;



void setup() {                                 // setup function is called once at the start of runtime, 
  size(300, 300, P3D);						   // similar to a 'constructor' in object-oriented programming
  noStroke();
  frameRate(30);
}


void draw() {                                  // draw function is called in an infinite loop, with a 
  background(255);                             // pause between each call (defined by frame rate)
  lights();

  /* background(shade);                           //Change background shade (black->white->black loop)
  shade += change;
  if (shade == 255) {
    change = -1;
  }
  if (shade == 0) {
    change = 1;
  } */
  
  translate(width/2, height/2, -height);       //Centered formation along x, y, and z axes
  
  float rx = map(rotsp, 0, 500, 0, PI);        //Rotation along x, y, and z axes
  float ry = map(rotsp, 0, 500, 0, PI);
  float rz = map(rotsp, 0, -500, 0, PI);
  rotsp += 2;
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  
  if (state == 0) {                            //Change color (rainbow effect loop) through RGB color mode
    g++;
    if (g == 255)
      state = 1;
  }
  if (state == 1) {
    r--;
    if (r == 0)
      state = 2;
  }
  if (state == 2) {
    b++;
    if (b == 255)
      state = 3;
  }
  if (state == 3) {
    g--;
    if (g == 0)
      state = 4;
  }
  if (state == 4) {
    r++;
    if (r == 255)
      state = 5;
  }
  if (state == 5) {
    b--;
    if (b == 0)
      state = 0;
  }
  
  fill(r, g, b);
  
  /* colorMode(HSB, 360, 100, 100);             //Original color code in HSB instead of RGB, but redone
   fill(rainbow, 100, 100);                    //in RGB due to Processing javascript bug
   rainbow += 1;
   if (rainbow > 360) {
   rainbow = 0;
   } */
  
  for (int x = -5; x <= 5; x += 2) {           //Create 6x6 spheres in cube formation through translation
    for (int y = -5; y <= 5; y += 2) {
      for (int z = -5; z <= 5; z += 2) {
        pushMatrix();
        translate(width/10*x, height/10*y, -height/10*z);
        sphere(width/12.5);
        popMatrix();
      }
    }
  }
}