// Printing Code: Homework 1
// On ITP’s laser printer, print a PDF file generated via a
// Processing sketch. A few rules about your code: You can only use black (0)
// and white (255). You are only allowed to use triangle(), rect() and 
// ellipse() once each, and no other drawing functions are allowed 
// (no beginShape or images). Bring to class a design of an ice cream cone. 
// Yes, and ice cream cone.

import processing.pdf.*;

// Set these variables to the print size you want (in inches)
// The resulting PDF will be this aspect ratio
float print_width = 8.5;
float print_height = 11;

// This will help make the sketch window bigger
float make_bigger = 40;

boolean savePDF = false;

void setup () {
  size(round(print_width * make_bigger), round(print_height * make_bigger));
  
}

void draw () {
  if(savePDF)  {
    println("Saving PDF");
    beginRecord(PDF, "grab" + year() + "_" + month()+ "_" + day() + "_" + hour() + "_" + minute() + "_" + second() + "_" + millis() + ".pdf"); 
  }
  background (0);
  smooth();
  noStroke();
  fill(255);
  rect(0, height-height/3, width, height/3);
  stroke (0);
  fill(255);
 ellipse (width-58, height-150, 25, 25);
  stroke (255);
  noStroke();
  fill (0);
  triangle(width-70, height-145, width-50, height-140, width-69, height-110);
  
  if(savePDF)
  {
    endRecord();
    println("Saved PDF");
    savePDF = false;
  }
}


void keyPressed() {
  if (key == 's') {  
    savePDF = true;
  }
}

