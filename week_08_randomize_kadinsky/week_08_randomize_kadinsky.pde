import geomerative.*;
import toxi.util.datatypes.*;
import processing.pdf.*;

// global variables

float print_width = 8.5;
float print_height = 9;
float make_bigger = 60;

float noiseVal;
float noiseScale=0.1;

int margin;
boolean savePDF = false;

RPoint[] points;
RPoint center;
int shapeSize;

void setup() 
{
  size(round(print_width * make_bigger), round(print_height * make_bigger));
  beginRecord(PDF, "grab" + year() + "_" + month()+ "_" + day() + "_" + hour() + "_" + minute() + "_" + second() + "_" + millis() + ".pdf");
  smooth();

  pushMatrix();
  colorMode(HSB, 360, 100, 100);
  for (int y = 0; y < height; y++) 
  {
    for (int x = 0; x < width; x++) 
    {
      noiseDetail(3, 0.5);
      noiseVal = noise((x) * noiseScale, (y) * noiseScale);
      stroke(30, 15 +(noiseVal*20), 86 + (noiseVal*60));
      point(x, y);
    }
  }
  popMatrix();

  colorMode(HSB, 100);
  //background(#E0D0BE);
  //background(30, 15, 86);


  RG.init(this);

  shapeSize = 100;
  margin = 100; 

  // random colors
  WeightedRandomSet<Integer> circleFill = new WeightedRandomSet<Integer>();

  circleFill.add(color(#744154, 80), 6); //purple
  circleFill.add(color(0, 99, 99, 80), 3); //red
  // circleFill.add(color(#FEFF00, 60), 1); //yellow
  circleFill.add(color(#234585, 80), 10); //blue
  circleFill.add(color(#29282C), 2); //very dark

  //random stroke weight
  WeightedRandomSet<Integer> sWeight = new WeightedRandomSet<Integer>();

  sWeight.add(0, 2); 
  sWeight.add(1, 4);
  sWeight.add(2, 2);
  sWeight.add(3, 2);
  sWeight.add(5, 1);

  // draw the intersecting rectangles
  pushMatrix();
  translate(width/2, height/2);
  fill(#5F9B88);
  noStroke();
  strokeWeight(1);
  RShape crossOne = new RShape();
  crossOne.addMoveTo(-width/3, -height/2);
  crossOne.addLineTo((-width/3) + 75, -height/2);
  crossOne.addLineTo(width+200, height-50);
  crossOne.addLineTo(width+100, height+100);
  crossOne.addMoveTo(-width/3, -height/2);
  crossOne.draw();
  popMatrix();

  pushMatrix();
  translate(width, 0);
  noStroke();
  fill(#D1B383);
  RShape crossTwo = new RShape();
  crossTwo.addMoveTo(0, 0);
  crossTwo.addLineTo(-50, 0);
  crossTwo.addLineTo(-width-50, height-50);
  crossTwo.addLineTo(-width, height + 75);
  crossTwo.addLineTo(0, 0);
  crossTwo.draw();
  popMatrix();

  // draw the main black circle (an RShape with an ellipse)
  pushMatrix();
  translate(width/2, height/2);
  noFill();
  stroke(0);
  strokeWeight(20);
  RShape blackEllipse = RShape.createEllipse(0, -25, shapeSize*4.5, shapeSize*4.5);
  blackEllipse.draw();

  // get the center of the main circle and translate to it   
  center = blackEllipse.getCenter();
  translate(center.x, center.y);

  // draw big cirlces
  float x = cos(radians(150)) * 10;
  float y = sin(radians(150)) * 10;

  stroke(0);
  strokeWeight(0.5);
  fill(#585943, 80); // dark yellow
  ellipse(x, y, shapeSize*1.5, shapeSize*1.5);

  fill(#FEFF00, 20); // yellow 
  ellipse(x-40, y+40, shapeSize, shapeSize);

  fill(#27705E, 80); //green
  ellipse(x+90, y-30, shapeSize, shapeSize);

  fill(0, 99, 99, 70);
  ellipse(x+70, y+60, shapeSize*.75, shapeSize*.75);
  ellipse(x+10, y-60, shapeSize*.75, shapeSize*.75);

  fill(#9F4759, 90);
  ellipse(x-40, y-90, shapeSize, shapeSize);

  fill(#744154, 90); //purple
  ellipse(x+100, y-100, shapeSize*.75, shapeSize*.75);

  // draw the medium circles using random center point, strokeweight & color
  for (int i = 0; i<10; i++) {
    float xM = cos(radians(random(360))) * random(100, 150);
    float yM = sin(radians(random(360))) * random(100, 150);
    stroke(0);
    strokeWeight(sWeight.getRandom());
    fill(circleFill.getRandom());
    ellipse(xM+ shapeSize*.3, yM+shapeSize*.3, shapeSize*.3, shapeSize*.3);
  }

  // draw the small circles using random center point, strokeweight & color
  for (int i = 0; i<10; i++) {
    float xS = cos(radians(random(360))) * random(150, 160);
    float yS = sin(radians(random(360))) * random(150, 160);
    stroke(0);
    strokeWeight(sWeight.getRandom());
    fill(circleFill.getRandom());
    ellipse(xS, yS, shapeSize*.2, shapeSize*.2);
  }

  // draw the really small circles using random center point, strokeweight & color
  for (int i = 0; i<3; i++) {
    float xSS = cos(radians(random(360))) * random(150, 160);
    float ySS = sin(radians(random(360))) * random(150, 160);
    stroke(0);
    strokeWeight(sWeight.getRandom());
    fill(circleFill.getRandom());
    ellipse(xSS, ySS, shapeSize*.05, shapeSize*.05);
  }

  popMatrix();

  // translate back to 0,0 & draw the lines 
  pushMatrix();
  translate(0, 0);
  for (int i = 0; i<16; i++) {
    strokeWeight(random(0.1, 1));
    stroke(0);
    line(random(margin, width-margin), random(margin, height-margin), random(margin, width-margin), random(margin, height-margin));
  }
  popMatrix();

  endRecord();
  println("Saved PDF");
  savePDF = false;
}

