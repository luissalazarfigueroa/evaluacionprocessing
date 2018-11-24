color fondo = color(250, 242, 230);
color cian = color(89, 187, 211);
String [] textos = {"a Pelican Book", "The Last Resource", "Tony Loftas","Man's Exploitation of the Oceans"};
PFont normal, light;
int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
PImage photo;
float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave


float yoff = 0.0;
void setup() {
   frameRate(10);
  size(400, 650);
  background(fondo);
  normal = loadFont("Helvetica-Bold-96.vlw");
  light = loadFont("HelveticaNeue-Light-48.vlw");
  photo = loadImage("pelicano3.png");
   w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw() {
  background(fondo);
  beginShape(); 
  fill(89, 187, 211);
  noStroke();
  float xoff = 0;       // Option #1: 2D Noise
  // float xoff = yoff; // Option #2: 1D Noise
  
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to 
    float y = map(noise(xoff, yoff), 0, 1, 400,300); // Option #1: 2D Noise
    // float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff += 0.05;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);

  beginShape(); 
    fill(49, 127, 161,100);
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 20) {
    // Calculate a y value according to noise, map to 
    float y = map(noise(xoff, yoff), 0, 1, 500,300); // Option #1: 2D Noise
    // float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff += 0.05;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  

    beginShape(); 
    fill(49, 127, 161,80);
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 20) {
    // Calculate a y value according to noise, map to 
    float y = map(noise(xoff, yoff), 0, 1, 240,340); // Option #1: 2D Noise
    // float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff += 0.05;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  
   beginShape(); 
  fill(29, 107, 191,80);
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 40) {
    // Calculate a y value according to noise, map to 
    float y = map(noise(xoff, yoff), 0, 1, 400,200); // Option #1: 2D Noise
    // float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff += 0.05;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  
  beginShape(); 
  fill(29, 107, 191,0);
  stroke(255,0,0,90);
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 1) {
    // Calculate a y value according to noise, map to 
    float y = map(noise(xoff, yoff), 0, 1, 400,200); // Option #1: 2D Noise
    // float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff += 0.05;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  
  
   calcWave();
  renderWave();
  
 image(photo, 20, 20, 40, 50);
  fill(fondo);
  noStroke();
  fill(0);
  textFont(light);
  textSize(20);
  text(textos[0], 130  , 35, 220, 30);
  textFont(normal);
  textSize(36);
  textLeading(36);
  text(textos[1], 130, 72, 220, 100);
  textSize(16);
  text(textos[3], 130, 145, 280, 120);
   textSize(20);
  text(textos[2], 130, 172, 220, 30);
    fill(255,0,0);
ellipse(300,400,40,40);
 
  translate(300,400);
   stroke(1);
   noFill();
   rotate(frameCount / 8.0);
    arc(0, 0, 50, 50,0, PI);
    rotate(50+frameCount / 3.0);
  arc(0, 0, 60, 60, HALF_PI, PI);
   rotate(100+frameCount / 6.0);
  arc(0, 0, 70, 70, PI, PI+QUARTER_PI);
   rotate(frameCount / 10.0);
  arc(0, 0, 80, 80, PI+QUARTER_PI, TWO_PI);

 

   
}
void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.08;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void renderWave() {
  noStroke();
  
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    fill(10,75,200);
    ellipse(x*xspacing, height/1+yvalues[x], 3, 300);
     fill(10,75,200);
       ellipse(x*xspacing+10, height/1+yvalues[x]-100, 1, 120);
 
  }
}


void keyPressed() {
  if (key == 'p') {
    saveFrame("propuesta-#####.png");
  }
}
