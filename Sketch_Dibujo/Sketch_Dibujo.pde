color fondo = color(250, 242, 230);
color cian = color(89, 187, 211);
String [] textos = {"a Pelican Book", "The Last Resource", "Tony Loftas","Man's Exploitation of the Oceans"};
PFont normal, light;

PImage photo;

int value = 0;
int val = 0;


void setup() {
   frameRate(10);
  size(400, 650);
  background(89, 187, 211);
  normal = loadFont("Helvetica-Bold-96.vlw");
  light = loadFont("HelveticaNeue-Light-48.vlw");
  photo = loadImage("pelicano3.png");

}

void draw() {

  beginShape(); 
  
  noStroke();
fill(fondo);
rect(0,0,400,250);
   
 pushMatrix();
 noStroke();
 fill(255,0,0,value);
  translate(mouseX, mouseY);
  ellipse(0,0,random(5,20),random(5,20));
  translate(+random(-10,10),+random(-10,10));
  ellipse(0,0,10,10);
   translate(+random(-10,10),+random(-10,10));
  ellipse(0,0,4,4);
     translate(+random(-10,10),+random(-10,10));
  ellipse(0,0,2,2);
  popMatrix();
  
  int val= 0;
   if (mousePressed == true) {
    val= 100;
  } else {
    val=0;
  }
  stroke(0,0,200,val);
  fill(0,0,200,val);
  arc(mouseX, mouseY,30,15,0.25,(2*PI)-0.25);
   pushMatrix();
    translate(mouseX+15, mouseY);
    rotate(45);
    fill(0,0,200,val);
    polygon(0, 0, 10, 3);  // Triangle
    popMatrix();
  
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
}

void mouseClicked() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
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
void keyPressed() {
  if (key == 'p') {
    saveFrame("propuesta-#####.png");
  }
}
