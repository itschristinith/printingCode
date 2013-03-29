/* Import libraries
 ----------------------------------------------------------- */

import geomerative.*;
import processing.pdf.*;

float print_width =  6;
float print_height = 6;
float make_bigger = 60;

RShape fishingtripz;
RShape fishing;
RShape tripz;
RShape fishy;
RPoint[][] pointPaths;
RPath fishingtripzPath;

float fishingtripzW;
float fishingtripzH;

float fishingW;
float fishingH;

float tripzW;
float tripzH;

float fishyW;
float fishyH;

void setup()
{
  size(round(print_width * make_bigger), round(print_height * make_bigger));
  smooth();

  beginRecord(PDF, "print.pdf");
  background(255);
  RG.init(this);
  RG.ignoreStyles(true);

  //load SVG files
  fishingtripz = RG.loadShape("fishingtripz.svg");
  fishing = RG.loadShape("fishing.svg");
  tripz = RG.loadShape("tripz.svg");
  fishy = RG.loadShape("fishy.svg");
int move =1;
  // center SVG files (?) 
  //  fishing = RG.centerIn(fishing, g);
  //  tripz = RG.centerIn(tripz, g);
  //  fishy = RG.centerIn(fishy,g);

  //scale SVG files
  fishingtripz.scale(2);
  fishing.scale(2);
  tripz.scale(2);
  fishy.scale(2);

  // get width for each SVG file
  fishingtripzW = (fishingtripz.getWidth() +5);
   fishingtripzH = (fishingtripz.getHeight() +5);
  fishingW = (fishing.getWidth() + 5); 
  tripzW = (tripz.getWidth() +5);
  fishyW = (fishy.getWidth() + 5);
  fishyH = (fishy.getHeight() + 5);

  //draw SVG files
  pushMatrix();
  translate(width/2 - fishingtripzW/2, height/2-fishingtripzH/2);
  fill(#1B56F2);
  //stroke(255);
  noStroke();
  fishingtripz.draw();
  popMatrix();

 
  pushMatrix();
  translate(width/2 + fishyW/4, height - fishyH*2);
 
 for (int i = 0; i<12; i++) {
  
  fill(0, random(30,100));
  noStroke();
//  fishy.scale(i);
  fishy.draw();
  translate(-fishyW+5, 0);
   rotate(radians(30));
 }
  popMatrix();
  
 
  //get points for fishingtripz SVG
  //RG.setPolygonizerLength(1);
  //pointPaths = fishingtripz.getPointsInPaths();
  //
  ////do something with points
  //translate (100, 100);
  //for (int i = 0; i<pointPaths.length; i++) {
  //  
  //  if (pointPaths[i] != null) {
  //      beginShape();
  //      for(int j = 0; j<pointPaths[i].length; j++){
  //        vertex(pointPaths[i][j].x, pointPaths[i][j].y);
  //        ellipse(pointPaths[0][1].x, pointPaths[0][1].y, 50, 50);
  //      }
  //      endShape();
  //    }
  //  }

  //  pushMatrix();
  //  translate(width/2, height/2);
  //  rotate(radians(30));
  //  fill(255);
  //  noStroke();
  //  tripz.draw();
  //  popMatrix();

    endRecord();
}

