/* Import libraries
 ----------------------------------------------------------- */

import geomerative.*;
import processing.pdf.*;

/* Global variables
 ----------------------------------------------------------- */

float print_width = 8.27;
float print_height = 11.69;
float make_bigger = 60;

RShape sun;
RShape also;
RShape rises;
RShape hemingway;

/* Setup
 ----------------------------------------------------------- */

void setup()
{
  size(round(print_width * make_bigger), round(print_height * make_bigger));
  setupShapes();
  smooth();
  

  /* 
   	FIRST.....
   	You will need to create your grid system. Change COLS, ROWS, GUTTER and PAGEMARGIN to integers.
   */

  ModularGrid grid = new ModularGrid(5, 9, 10, 30);

  beginRecord(PDF, "print.pdf");
  background(#FF6200);
  grid.display();
  noStroke();

  /* 
   	SECOND.....
   	Now place the shapes in the grid.
   	Try to place them, size them, overlay them, color them. Think about scale.
   	You will need to translate and scale the shapes to fit the modules. Here's how you do that:
   	
   			// first get a module
   			Module first = grid.modules[0][0];
   			
   			// then translate to the module position
   			translate(first.x, first.y);
   
   			// then scale the shape beto the module before drawing it
   			head.scale(first.w / head.width);
   
   			// remember, that you can make the shape span 2 modules by doing this:
   			head.scale(first.w / ((head.width * 2) + gutterSize));
   
   			// then draw the shape
   			head.draw();
   */
   Module six = grid.modules[0][6];
  pushMatrix();
  translate(six.x, six.y);
  fill(#F6FF00);
  ellipseMode(CORNER);
  ellipse(0, 0, 4*six.w, 4*six.w);
  popMatrix();

  Module first = grid.modules[0][8];
  pushMatrix();
  translate(first.x, first.y+20);
  // then scale the shape beto the module before drawing it
  sun.scale(9*(first.w) / sun.width);
 //  sun.scale(.7*(first.w) / first.h);
  // draw a head
  fill(0, 0, 0);
  sun.draw();
  popMatrix();

Module two = grid.modules[2][7];
  pushMatrix();
   translate(two.x+10, two.y);
  // also.scale(6*(two.w / also.width));
    also.scale((two.w*.5) / (two.h));
  // draw a butterfly
  fill(0);
   also.draw();
  popMatrix();

Module three = grid.modules[3][7];
  pushMatrix();
  translate(three.x, three.y);
  // rises.scale(8*(three.w) / (rises.width));
    rises.scale((three.w*.8) / (three.h));
  fill(0);
    rises.draw();
    popMatrix();

  Module four = grid.modules[0][0];
  pushMatrix();
  translate(four.x, four.y);
  // draw sigur ros
  fill(0);
  hemingway.scale((four.w*2) / (four.h));
  hemingway.draw();
  popMatrix();
  
  Module five = grid.modules[0][1];
  pushMatrix();
  translate(five.x, five.y);
  fill(#F6FF00);
  ellipseMode(CORNER);
  //ellipse(0, 0, 2*five.w, 2*five.w);
  popMatrix();
  
  endRecord();
}




/* Stuff you don't need to worry about unless you want to
 ---------------------------------------------------- */

/*
	Some fun methods you can try to use in the RShape objects
 
 	shape.draw(); // always draws in 0,0
 	shape.translate(); // alternate translate just for this shape
 	shape.scale(float); // scale the shape by a percentage
 	shape.transform(x, y, width, height); // fit the shape inside a rectangle width this x,y,width,height
 	shape.getX();
 	shape.getY();
 	shape.getWidth();
 	shape.getHeight();
 */

void setupShapes()
{
  RG.init(this);
  RG.ignoreStyles(true);

  sun = RG.loadShape("sun.svg");
  also = RG.loadShape("also.svg");
  rises = RG.loadShape("rises.svg");
  hemingway = RG.loadShape("hemingway.svg");
}

